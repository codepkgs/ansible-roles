#!/bin/bash

echo "installing"

export LANG=en_US.UTF-8
export LANGUAGE=en_US:

#有些系统下安装后可能没有写文件的权限，导致日志文件写入失败
ulimit -v unlimited
if [[ -z "${VERSION}" ]]; then
  VERSION=2.1.56
fi
if [[ -z "${ARGUS_VERSION}" ]]; then
  ARGUS_VERSION=3.4.10
fi
if [[ -z "${REGION_ID}" ]]; then
  REGION_ID="$(wget -q --timeout=1 -t 1 -O - 'http://100.100.100.200/latest/meta-data/region-id')"
fi

if [[ -z "${CMS_HOME}" ]]; then
  CMS_HOME_PREFIX="/usr/local"
  if [[ -f /etc/os-release && ! -z "`egrep -i coreos /etc/os-release`" ]];then
    CMS_HOME_PREFIX="/opt"
  fi 
fi
CMS_HOME="${CMS_HOME_PREFIX}/cloudmonitor"

if [[ `uname -m` = "x86_64" ]]; then
    ARCH="amd64"
    ARGUS_ARCH="linux64"
elif [[ `uname -m` = "aarch64" ]]; then
    ARCH="arm"
    ARGUS_ARCH="arm64"
else
    ARCH="386"
    ARGUS_ARCH="linux32"
fi

case `uname -s` in
  Linux)
    CMS_OS="linux"
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    exit 1
    ;;
esac
TAR_FILE=cloudmonitor_${ARGUS_ARCH}.tar.gz
DOWNLOAD_PATH=Argus/${ARGUS_VERSION}/${TAR_FILE}
DEST_UPDATE_FILE=${CMS_HOME}/${TAR_FILE}
DEST_BIN_FILE=${CMS_HOME}/bin/argusagent
DEST_START_FILE=${CMS_HOME}/cloudmonitorCtl.sh
#卸载java和goagent
GOAGENT_ELF_NAME=${CMS_HOME}/CmsGoAgent.${CMS_OS}-${ARCH}
if [[ -d ${CMS_HOME} ]] ; then
  if [[ -f ${DEST_START_FILE} ]];then
    ${DEST_START_FILE} stop
  fi
  if [[ -f ${CMS_HOME}/wrapper/bin/cloudmonitor.sh ]] ; then
    ${CMS_HOME}/wrapper/bin/cloudmonitor.sh remove;
    rm -rf ${CMS_HOME};
  fi 
  if [[ -f ${GOAGENT_ELF_NAME} ]]; then
    ${GOAGENT_ELF_NAME} stop
    rm -rf ${CMS_HOME}
  fi
fi

download()
{
  if [[ -z "${REGION_ID}" ]]; then
    echo "networkType is classic"
    OSS_URL="http://cloudmonitor-agent.oss-cn-hangzhou.aliyuncs.com/$DOWNLOAD_PATH"
  else
    echo "networkType is vpc, REGION_ID: $REGION_ID"
    if [[ "$REGION_ID" =~ "finance" ]]; then
      OSS_URL="http://cms-agent-$REGION_ID.oss-$REGION_ID-pub-internal.aliyuncs.com/$DOWNLOAD_PATH"
    elif [[ "$REGION_ID" = "ap-south-1" ]]; then
      OSS_URL="http://cms-download.aliyun.com/$DOWNLOAD_PATH"
      CMS_PROXY="cmsproxy-ap-south-1.aliyuncs.com:8080"
    elif [[ "$REGION_ID" = "me-east-1" || "$REGION_ID" = "cn-chengdu" ]]; then
      OSS_URL="http://cms-download.aliyun.com/$DOWNLOAD_PATH"
    else
      OSS_URL="http://cms-agent-$REGION_ID.oss-$REGION_ID-internal.aliyuncs.com/$DOWNLOAD_PATH"
    fi
  fi
  echo download from "$OSS_URL"
  wget -q -e "http_proxy=$CMS_PROXY" "$OSS_URL" -O "$DEST_UPDATE_FILE" -t 3 --connect-timeout=2
  if [[ $? != 0 ]]; then
    echo "download fail, retry..."
    CMS_PROXY="vpc-opencmsproxy.aliyun.com:8080";
    OSS_URL="http://cms-download.aliyun.com/$DOWNLOAD_PATH"
    wget -q -e "http_proxy=$CMS_PROXY" "$OSS_URL" -O "$DEST_UPDATE_FILE" -t 3 --connect-timeout=2
  fi
  if [[ $? != 0 ]]; then
    echo "download fail, retry..."
    CMS_PROXY="opencmsproxy.aliyun.com:8080";
    OSS_URL="http://cms-download.aliyun.com/$DOWNLOAD_PATH"
    wget -q -e "http_proxy=$CMS_PROXY" "$OSS_URL" -O "$DEST_UPDATE_FILE" -t 3 --connect-timeout=2
  fi
}

mkdir -p ${CMS_HOME}
if [[ "linux" == "${CMS_OS}" ]]; then
    chown -R root:root ${CMS_HOME}
fi
download

if [[ ! -f "${DEST_UPDATE_FILE}" ]]; then
    echo "download failed: {$DEST_UPDATE_FILE}"
    exit 3
fi
#解压
tar xf ${DEST_UPDATE_FILE} -C ${CMS_HOME_PREFIX}
rm -f ${DEST_UPDATE_FILE}
#配置文件拷贝
mkdir -p "$CMS_HOME/local_data/conf"
if [[ -n "${CMS_AGENT_ACCESSKEY}" ]]; then
    echo cms.agent.accesskey=${CMS_AGENT_ACCESSKEY} > "${CMS_HOME}/local_data/conf/accesskey.properties"
    echo cms.agent.secretkey=${CMS_AGENT_SECRETKEY} >> "${CMS_HOME}/local_data/conf/accesskey.properties"
elif [[ -f accesskey.properties ]]; then
    cp accesskey.properties ${CMS_HOME}/local_data/conf
fi

if [ ! -d /etc/cloudmonitor ];then
	mkdir /etc/cloudmonitor
fi
#启动agent
chmod +x ${DEST_START_FILE}
${DEST_START_FILE} uninstall
${DEST_START_FILE} install
${DEST_START_FILE} start
#版本检测
ACT_VERSION=`${DEST_BIN_FILE} -v`
if [[ -n "${ACT_VERSION}" ]]; then
    echo argusagent v${ACT_VERSION} installed
else
    echo argusagent install failed
    exit 5
fi


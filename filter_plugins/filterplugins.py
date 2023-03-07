class FilterModule:
    """
    过滤器的第一个参数（非self）为传递过来的内容，第二个以后的参数才是函数调用使用的。
    """

    def surround_by_quotes(self, items):
        return [f'"{item}"' for item in items]

    def add_prefix(self, content, prefix):
        """
        {{abc|add_prefix("prefix")}}
        传递给add_prefix的第一个参数是abc作为content，函数里面指定的prefix才传给换上的prefix。
        """
        return f"{prefix}{content}"

    def filters(self):
        return {"surround_by_quotes": self.surround_by_quotes, "add_prefix": self.add_prefix}

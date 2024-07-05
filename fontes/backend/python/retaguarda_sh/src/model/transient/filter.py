class Filter:
    def __init__(self, query_params):
        self.field = None
        self.value = None
        self.initial_date = None
        self.final_date = None
        self.where = ""

        if query_params.get("filter"):
            filters = query_params["filter"].split(",")
            for filter_str in filters:
                parts = filter_str.split("||")
                if len(parts) != 3:
                    continue
                field, condition, value = parts
                if condition == "$eq":
                    self.where += f"{field} = '{value}'"
                elif condition == "$between":
                    initial_date, final_date = value.split(",")
                    self.where += f"{field} BETWEEN '{initial_date}' AND '{final_date}'"
                elif condition == "$cont":
                    self.where += f"{field} LIKE '%{value}%'"
                self.where += " AND "
            self.where = self.where.rstrip(" AND ")

    def __str__(self):
        return f"Filter(field={self.field}, value={self.value}, initial_date={self.initial_date}, final_date={self.final_date}, where={self.where})"
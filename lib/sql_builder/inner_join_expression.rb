module SqlBuilder
  class InnerJoinExpression
    attr_accessor :table, :on_expression

    def initialize(hash = {})
      @table = hash[:table]
      @on_expression = hash[:on_expression]
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Table Expression: table cannot be missing" if !@table or @table.empty?

      result = "INNER JOIN #{@table.to_sql}"
      result += " ON #{@on_expression.to_sql}" if @on_expression
      result
    end
  end
end

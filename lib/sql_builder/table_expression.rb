module SqlBuilder
  class TableExpression
    attr_accessor :table, :inner_join_expression

    def initialize(hash = {})
      @table = hash[:table]
      @inner_join_expression = hash[:inner_join_expression]
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Table Expression: table cannot be missing" if !@table

      result = "#{table.to_sql}"
      result += " #{inner_join_expression.to_sql}" if @inner_join_expression
      result
    end
  end
end

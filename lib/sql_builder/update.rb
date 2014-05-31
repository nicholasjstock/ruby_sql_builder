module SqlBuilder
  class Update
    attr_accessor  :table,  :expression, :values

    def initialize(hash = {})
      @table = hash[:table]
      @values = hash[:values]
      @expression = hash[:expression]
    end

    def to_values
      raise ArgumentError, "SqlBuilder Select: values cannot be missing or empty" if @values.nil? || @values.empty?
      @values.collect(&:to_sql).join(', ')
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Select: tables cannot be missing or empty" if @table.nil? || @table.empty?
      result = "UPDATE #{@table.to_sql}"
      result += " SET #{to_values}"
      result += " WHERE #{@expression.to_sql}" if @expression
      result
    end
  end
end

module SqlBuilder
  class Select
    attr_accessor :select_expressions, :tables, :inner_join_expressions, :expression, :group_expressions, :order_expressions

    def initialize(hash)

      @select_expressions = hash[:select_expressions]
      @tables = hash[:tables]
      @inner_join_expressions = hash[:inner_join_expressions]
      @group_expressions = hash[:group_expressions]
      @order_expressions = hash[:order_expressions]
      @expression = hash[:expression]
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Select: select_expressions cannot be missing or empty" if @select_expressions.nil? or @select_expressions.empty?
      raise ArgumentError, "SqlBuilder Select: tables cannot be missing or empty" if @tables.nil? or @tables.empty?
      result = "SELECT #{@select_expressions.collect(&:to_sql).join(', ')}"
      result += " FROM #{@tables.collect(&:to_sql).join(', ')}"
      result += " #{@inner_join_expressions.collect(&:to_sql).join(' ')}" unless @inner_join_expressions.nil?
      result += " WHERE #{@expression.to_sql}" if @expression
      result += " GROUP BY #{@group_expressions.collect(&:to_sql).join(', ')}" unless @group_expressions.nil?
      result += " ORDER BY #{@order_expressions.collect(&:to_sql).join(', ')}" unless @order_expressions.nil?
      result
    end
  end
end

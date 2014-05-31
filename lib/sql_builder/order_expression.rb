module SqlBuilder
  class OrderExpression
    attr_accessor :expression, :order

    def initialize(*args)
      opts = args.extract_options!

      @expression = opts[:expression]
      @order = opts[:order]
    end

    def to_sql
      raise "SqlBuilder OrderExpression: expression cannot be missing" if !@expression
      raise "SqlBuilder OrderExpression: order must be either :asc or :desc" if @order and @order != :asc and @order != :desc

      result = @expression.to_sql
      result += " #{@order.to_sql.upcase}" if @order
      result
    end
  end
end

module SqlBuilder
  class Delete
    attr_accessor :tables, :expression

    def initialize(*args)
      opts = args.extract_options!

      @tables = opts[:tables]
      @expression = opts[:expression]
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Delete: tables cannot be missing or empty" if @tables.blank?

      result = "DELETE"
      result += " FROM #{@tables.collect(&:to_sql).join(', ')}"
      result += " WHERE #{@expression.to_sql}" if @expression
      result
    end
  end
end

module SqlBuilder
  class Function
    attr_accessor  :function,  :arguments

    def initialize(hash = {})
      @function = hash[:function]
      @arguments = hash[:arguments] || []
    end

    def to_arguments
      @arguments.collect(&:to_sql).join(', ')
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Function: function cannot be missing or empty" unless @function
      "#{function.to_sql}(#{to_arguments})"
    end
  end
end

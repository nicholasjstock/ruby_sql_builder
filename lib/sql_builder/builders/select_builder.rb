module SqlBuilder
  class SelectBuilder
    def initialize(args)
      @select_expression = Select.new(args)
    end
     def self.[](*args)
       SelectBuilder.new(:select_expressions => args)
     end
     
     def [](*args)
       @select_expression.tables = args
       self
     end
     def from(*args)
       self
     end
     
     def where (&block)
       @select_expression.expression = ConditionBuilder.new(&block)
       self
     end
     
     def to_sql
       @select_expression.to_sql
     end
     
  end
end

module SqlBuilder
  class NestedConditionalBuilder
    def initialize(&block)
      @sqlparts = []
      instance_eval(&block)
    end
    def where (&block)
      @sqlparts[]= AndConditionBuilder.new(&block)
      self
     end

     def or_where (&block)
       @sqlparts[]= ExpressionBuilder.new(&block)
       self
     end
   
     def to_sql
       AndCondition.new(:conditions => @sqlparts).to_sql
     end
     
  end
end

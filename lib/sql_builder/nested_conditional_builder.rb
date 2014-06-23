module SqlBuilder
  class NestedConditionalBuilder
    def initialize(&block)
      @sqlparts = []
      instance_eval(&block)
    end
    def where (&block)
      @sqlparts.push AndConditionBuilder.new(&block)
      self
     end

     def or_where (&block)
       @sqlparts.push ExpressionBuilder.new(&block)
      
       self
     end
   
     def to_sql
       if (@sqlparts.length > 1)
         AndCondition.new(:conditions => @sqlparts).to_sql
       else
         @sqlparts[0].to_sql
       end
     end
     
  end
end

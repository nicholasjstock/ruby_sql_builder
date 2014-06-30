module SqlBuilder
  class ConditionBuilder
    def initialize(&block)
      @sqlparts = []
      instance_eval(&block)
    end
    def append_and (&block)
      @sqlparts.push AndConditionBuilder.new(&block)
      self
     end

     def append_or (&block)
       @sqlparts.push ExpressionBuilder.new(&block)
       self
     end
     def equal(lhs,rhs)
       @sqlparts.push SqlBuilder::Condition.new(lhs: lhs, op: "=", rhs: rhs)
       self
     end
     
     def condition(lhs, rhs, op)
       @sqlparts.push SqlBuilder::Condition.new(lhs: lhs, op: op, rhs: rhs)
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

module SqlBuilder
  class AndConditionBuilder
    def initialize(&block)
      @sqlparts = []
      instance_eval(&block)
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
       SqlBuilder::AndCondition.new(conditions: @sqlparts).to_sql
     end
  end
end

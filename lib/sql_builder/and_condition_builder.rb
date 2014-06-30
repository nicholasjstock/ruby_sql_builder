module SqlBuilder
  class AndConditionBuilder < ConditionBuilder
    def initialize(&block)
      @sqlparts = []
      instance_eval(&block)
      self
    end
     def to_sql
       SqlBuilder::AndCondition.new(conditions: @sqlparts).to_sql
     end
  end
end

module SqlBuilder
  class ExpressionBuilder < AndConditionBuilder
     def to_sql
       Expression.new(conditions: @sqlparts).to_sql
     end
  end
end

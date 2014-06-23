# < AndConditionBuilder
describe 'or where builder' do
  it 'full functional test' do
     a = SqlBuilder::ExpressionBuilder.new do
        equal "table_one.a", "table_two.b"
        equal "table_one.b", "table_two.c"
      end
      expect(a.to_sql).to eq "(table_one.a = table_two.b OR table_one.b = table_two.c)"
  end
end
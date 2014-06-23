describe 'where builder' do
  it 'full functional test' do
     a = SqlBuilder::AndConditionBuilder.new do
        equal "table_one.a", "table_two.b"
      end
      expect(a.to_sql).to eq "(table_one.a = table_two.b)"
  end
  it 'full functional test' do
     a = SqlBuilder::AndConditionBuilder.new do
        equal "table_one.a", "table_two.b"
        equal "table_one.b", "table_two.c"
      end
      expect(a.to_sql).to eq "(table_one.a = table_two.b AND table_one.b = table_two.c)"
  end

  it 'full functional test' do
     a = SqlBuilder::AndConditionBuilder.new do
        condition "table_one.a", "table_two.b", "OPERATOR"
      end
      expect(a.to_sql).to eq "(table_one.a OPERATOR table_two.b)"
  end
end
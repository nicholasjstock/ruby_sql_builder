describe 'inner_join_expression' do
  it 'with table attribute and no expression' do
    inner_join_expression = SqlBuilder::InnerJoinExpression.new(:table => :a)
    expect(inner_join_expression.to_sql).to eq("INNER JOIN #{inner_join_expression.table.to_sql}")
  end
  it 'with table attribute and on expression' do
    inner_join_expression = SqlBuilder::InnerJoinExpression.new(:table => :a, :on_expression => :b)
    expect(inner_join_expression.to_sql).to eq("INNER JOIN #{inner_join_expression.table.to_sql} ON #{inner_join_expression.on_expression.to_sql}")
  end

  it 'table empty raises' do
    inner_join_expression = SqlBuilder::InnerJoinExpression.new()
    expect{ inner_join_expression.to_sql }.to raise_error(ArgumentError)
  end

  it 'table blank raises' do
    inner_join_expression = SqlBuilder::InnerJoinExpression.new(:table => "")
    expect{ inner_join_expression.to_sql }.to raise_error(ArgumentError)
  end

end

require 'spec_helper'
describe "Table" do
  it 'test_to_sql_when_inner_join_expression_is_missing' do
    table_expression = SqlBuilder::TableExpression.new( :table => :a )
    expect(table_expression.to_sql).to eq("#{table_expression.table.to_sql}")
  end

  it 'test_to_sql_with_inner_join_expression' do
    table_expression = SqlBuilder::TableExpression.new( :table => :a, :inner_join_expression => :b )
    expect(table_expression.to_sql).to eq("#{table_expression.table.to_sql} #{table_expression.inner_join_expression.to_sql}")
  end

  it 'test_to_sql_raises_when_table_is_missing' do
    table_expression = SqlBuilder::TableExpression.new()
    expect{ table_expression.to_sql }.to raise_error(ArgumentError)
  end
end


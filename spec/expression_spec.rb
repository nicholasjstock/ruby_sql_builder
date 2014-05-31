
require 'spec_helper'
describe "Expression" do
  it 'single condition returns condition' do
    expression = SqlBuilder::Expression.new(:conditions => [ :a ])
    expect(expression.to_sql).to eq("(#{expression.conditions[0].to_sql})")
  end

  it 'test_three_conditions_return_3_conditions_seperated_by_2_ands' do
    expression = SqlBuilder::Expression.new(:conditions => [ :a, :b, :c ])
    expect(expression.to_sql).to eq ("(#{expression.conditions[0].to_sql} OR #{expression.conditions[1].to_sql} OR #{expression.conditions[2].to_sql})")
  end

  it 'no conditions raises' do
    expression = SqlBuilder::Expression.new
    expect{ expression.to_sql }.to raise_error(ArgumentError)
  end

  it 'conditions empy raises' do
    expression = SqlBuilder::Expression.new(:conditions => [])
    expect{ expression.to_sql }.to raise_error(ArgumentError)
  end
end
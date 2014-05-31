
require 'spec_helper'
describe "AndCondition" do
  it 'single condition returns condition' do
    and_condition = SqlBuilder::AndCondition.new(:conditions => [ :a ])
    expect(and_condition.to_sql).to eq("(#{and_condition.conditions[0].to_sql})")
  end

  it 'test_three_conditions_return_3_conditions_seperated_by_2_ands' do
    and_condition = SqlBuilder::AndCondition.new(:conditions => [ :a, :b, :c ])
    expect(and_condition.to_sql).to eq ("(#{and_condition.conditions[0].to_sql} AND #{and_condition.conditions[1].to_sql} AND #{and_condition.conditions[2].to_sql})")
  end

  it 'no conditions raises' do
    and_condition = SqlBuilder::AndCondition.new
    expect{ and_condition.to_sql }.to raise_error(ArgumentError)
  end

  it ' conditions empy raises' do
    and_condition = SqlBuilder::AndCondition.new(:conditions => [])
    expect{ and_condition.to_sql }.to raise_error(ArgumentError)
  end
end
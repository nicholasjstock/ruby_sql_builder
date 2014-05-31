require 'spec_helper'
describe 'Condition' do
  it 'to_sql_returns_lhs_op_rhs' do
    condition = SqlBuilder::Condition.new(:lhs => :a, :op => :b, :rhs => :c)
    expect(condition.to_sql).to eq("#{condition.lhs.to_sql} #{condition.op.to_sql} #{condition.rhs.to_sql}")
  end

  it 'to_sql_raises_when_lhs_missing' do
    condition = SqlBuilder::Condition.new(:op => :b, :rhs => :c)
    expect{condition.to_sql}.to raise_error ArgumentError
  end

  it 'to_sql_raises_when_rhs_missing' do
    condition = SqlBuilder::Condition.new(:lhs => :c, :op => :b)
    expect{condition.to_sql}.to raise_error ArgumentError
  end

  it 'to_sql_raises_when_op_missing' do
    condition = SqlBuilder::Condition.new(:lhs => :c, :rhs => :b)
    expect{condition.to_sql}.to raise_error ArgumentError
  end

end


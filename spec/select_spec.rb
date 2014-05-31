describe 'select' do
  it 'test_to_sql_with_1_group_by_expression' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a ], :group_expressions => [ :a ])
    expect(select.to_sql).to eq("SELECT #{select.select_expressions[0].to_sql} FROM #{select.tables[0].to_sql} GROUP BY #{select.group_expressions[0].to_sql}")
  end

  it 'test_to_sql_with_many_group_expressions' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a ], :group_expressions => [ :a, :b ])
    expected_group_by_expression = "#{select.group_expressions[0].to_sql}, #{select.group_expressions[1].to_sql}"
    expect(select.to_sql).to eq("SELECT #{select.select_expressions[0].to_sql} FROM #{select.tables[0].to_sql} GROUP BY #{expected_group_by_expression}")
  end

  it 'test_to_sql_with_1_order_by_expression' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a ], :order_expressions => [ :a ])
    expect(select.to_sql).to eq("SELECT #{select.select_expressions[0].to_sql} FROM #{select.tables[0].to_sql} ORDER BY #{select.order_expressions[0].to_sql}")

  end

  it 'test_to_sql_with_many_order_expressions' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a ], :order_expressions => [ :a, :b ])
    expected_order_by_expression = "#{select.order_expressions[0].to_sql}, #{select.order_expressions[1].to_sql}"
    expect(select.to_sql).to eq("SELECT #{select.select_expressions[0].to_sql} FROM #{select.tables[0].to_sql} ORDER BY #{expected_order_by_expression}")
  end

  it 'test_to_sql_with_1_select_expression_and_1_table_expression_and_no_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a ])
    expect(select.to_sql).to eq("SELECT #{select.select_expressions[0].to_sql} FROM #{select.tables[0].to_sql}")
  end


  it 'test_to_sql_with_many_select_expressions_and_1_table_expression_and_no_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a, :b ], :tables => [ :a ])
    select_expressions_expected = "#{select.select_expressions[0].to_sql}, #{select.select_expressions[1].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected}")
  end

  it 'test_to_sql_with_1_select_expression_and_many_table_expressions_and_no_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a, :b ])
    select_expressions_expected = "#{select.select_expressions[0].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}, #{select.tables[1].to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected}")
  end

  it 'test_to_sql_with_many_select_expressions_and_many_table_expressions_and_no_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a, :b ], :tables => [ :a, :b ])
    select_expressions_expected = "#{select.select_expressions[0].to_sql}, #{select.select_expressions[1].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}, #{select.tables[1].to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected}")
  end

  it 'test_to_sql_with_1_select_expression_and_1_table_expression_and_an_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a ], :expression => :a)
    expect(select.to_sql).to eq("SELECT #{select.select_expressions[0].to_sql} FROM #{select.tables[0].to_sql} WHERE #{select.expression.to_sql}")
  end

  it 'test_to_sql_with_many_select_expressions_and_1_table_expression_and_an_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a, :b ], :tables => [ :a ], :expression => :a)
    select_expressions_expected = "#{select.select_expressions[0].to_sql}, #{select.select_expressions[1].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}"
    expression_expected = "#{select.expression.to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected} WHERE #{expression_expected}")
  end

  it 'test_to_sql_with_1_select_expression_and_many_table_expressions_and_an_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [ :a, :b ], :expression => :a)

    select_expressions_expected = "#{select.select_expressions[0].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}, #{select.tables[1].to_sql}"
    expression_expected = "#{select.expression.to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected} WHERE #{expression_expected}")
  end

  it 'test_to_sql_with_1_select_expression_and_many_table_expressions_and_an_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a, :b ], :tables => [ :a, :b ], :expression => :a)
    select_expressions_expected = "#{select.select_expressions[0].to_sql}, #{select.select_expressions[1].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}, #{select.tables[1].to_sql}"
    expression_expected = "#{select.expression.to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected} WHERE #{expression_expected}")
  end

  it 'test_to_sql_with_many_select_expressions_and_many_table_expressions_and_an_expression_returns' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a, :b ], :tables => [ :a, :b ], :expression => :a)
    select_expressions_expected = "#{select.select_expressions[0].to_sql}, #{select.select_expressions[1].to_sql}"
    table_expressions_expected = "#{select.tables[0].to_sql}, #{select.tables[1].to_sql}"
    expression_expected = "#{select.expression.to_sql}"
    expect(select.to_sql).to eq("SELECT #{select_expressions_expected} FROM #{table_expressions_expected} WHERE #{expression_expected}")
  end

  it 'test_to_sql_raises_runtime_error_when_select_expressions_is_missing' do
    select = SqlBuilder::Select.new(:tables => [ :a ])
    expect{ select.to_sql }.to raise_error(ArgumentError)
  end

  it 'test_to_sql_raises_runtime_error_when_select_expressions_is_empty' do
    select = SqlBuilder::Select.new(:tables => [ :a ], :select_expressions => [])
    expect{ select.to_sql }.to raise_error(ArgumentError)
  end

  it 'test_to_sql_raises_runtime_error_when_table_expressions_is_missing' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ])
    expect{ select.to_sql }.to raise_error(ArgumentError)
  end

  it 'test_to_sql_raises_runtime_error_when_table_expressions_is_empty' do
    select = SqlBuilder::Select.new(:select_expressions => [ :a ], :tables => [])
    expect{ select.to_sql }.to raise_error(ArgumentError)
  end

end


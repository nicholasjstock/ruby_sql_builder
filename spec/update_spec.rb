describe 'update' do
  it 'with table attribute and values' do
    insert = SqlBuilder::Update.new(:table => :a, :values => [:b,:c])
    expect(insert.to_sql).to eq("UPDATE #{insert.table.to_sql} SET #{insert.values[0].to_sql}, #{insert.values[1].to_sql}")
  end

  it 'with table attribute and values and where' do
    insert = SqlBuilder::Update.new(:table => :a, :values => [:b,:c], :expression => :c)
    expect(insert.to_sql).to eq("UPDATE #{insert.table.to_sql} SET #{insert.values[0].to_sql}, #{insert.values[1].to_sql} WHERE #{insert.expression.to_sql}")
  end


  it 'missing table' do
    insert = SqlBuilder::Update.new(:values => [:b,:c])
    expect{ insert.to_sql }.to raise_error(ArgumentError)
  end

  it 'with table empty' do
    insert = SqlBuilder::Update.new(:table => "", :values => [:b,:c])
    expect{ insert.to_sql }.to raise_error(ArgumentError)
  end

  it 'missing values' do
    insert = SqlBuilder::Update.new(:table => :a)
    expect{ insert.to_sql }.to raise_error(ArgumentError)
  end

  it 'values empty' do
    insert = SqlBuilder::Update.new(:table => :a, :values => [])
    expect{ insert.to_sql }.to raise_error(ArgumentError)
  end


end
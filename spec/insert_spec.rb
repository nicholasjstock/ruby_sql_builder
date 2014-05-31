describe 'insert' do
  it 'with table attribute and values' do
    insert = SqlBuilder::Insert.new(:table => :a, :values => [[:b,:c]])
    expect(insert.to_sql).to eq("INSERT INTO #{insert.table.to_sql} VALUES (#{insert.values[0][0].to_sql}, #{insert.values[0][1].to_sql})")
  end

  it 'with table attribute and values and columns' do
    insert = SqlBuilder::Insert.new(:table => :a, :columns => [:d,:f], :values => [[:b,:c]])
    expect(insert.to_sql).to eq("INSERT INTO #{insert.table.to_sql} (#{insert.columns[0].to_sql}, #{insert.columns[1].to_sql}) VALUES (#{insert.values[0][0].to_sql}, #{insert.values[0][1].to_sql})")
  end


  it 'missiing table' do
    insert = SqlBuilder::Insert.new( :columns => [:d,:f], :values => [:b,:c])
    expect{ insert.to_sql }.to raise_error(ArgumentError)
  end


  it 'with table empty string' do
    insert = SqlBuilder::Insert.new(:table => "", :columns => [:d,:f], :values => [[:b,:c]])
    expect{ insert.to_sql }.to raise_error(ArgumentError)

  end

end
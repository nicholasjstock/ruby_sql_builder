describe 'Function' do
  it 'functions with no arguments' do
    function = SqlBuilder::Function.new(:function => :a)
    expect(function.to_sql).to eq("#{function.function}()")
  end

  it 'functions with arguments' do
    function  =SqlBuilder::Function.new(:function => :a, :arguments => [:b,:c,:d])
    expect(function.to_sql).to eq("#{function.function}(#{function.arguments[0]}, #{function.arguments[1]}, #{function.arguments[2]})")
  end

  it 'no function raises' do
    function = SqlBuilder::Function.new
    expect{ function.to_sql }.to raise_error(ArgumentError)
  end

end
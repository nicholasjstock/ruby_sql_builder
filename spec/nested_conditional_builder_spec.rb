describe 'nested conditional builder' do
  it 'select where works' do
     select =  SqlBuilder::NestedConditionalBuilder.new do
        where do
          condition "table_one.a", "table_two.b", "="
        end
      end
     expect(select.to_sql).to eq "(table_one.a = table_two.b)"
end

  it 'select where two expression has and between the two' do
    select =  SqlBuilder::NestedConditionalBuilder.new do
      where do
        equal "table_one.a", "table_two.b"
        equal "table_one.c", "table_two.d"
     end
     end
     expect(select.to_sql).to eq "(table_one.a = table_two.b AND table_one.c = table_two.d)"
  end

  it 'select or_where two expression has or between the two' do
    select = SqlBuilder::NestedConditionalBuilder.new  do
      or_where do
        equal "table_one.a", "table_two.b"
        equal "table_one.c", "table_two.d"
      end
     end
     expect(select.to_sql).to eq "(table_one.a = table_two.b OR table_one.c = table_two.d)"
  end
  it 'select or_where two expression has or between the two' do
    select = SqlBuilder::NestedConditionalBuilder.new  do
      or_where do
        where do
          equal "table_one.a", "table_two.b"
          equal "table_one.c", "table_two.d"
        end
        where do
          equal "table_one.e", "table_two.f"
          equal "table_one.g", "table_two.h"
        end
      end
     end
     expect(select.to_sql).to eq "(table_one.a = table_two.b AND table_one.c = table_two.d) OR (table_one.e = table_two.f AND table_one.g = table_two.h)"
  end
end
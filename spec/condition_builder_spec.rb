describe 'nested conditional builder' do
  it 'select where works' do
     select =  SqlBuilder::ConditionBuilder.new do
        append_and do
          condition "table_one.a", "table_two.b", "="
        end
      end
     expect(select.to_sql).to eq "(table_one.a = table_two.b)"
end

  it 'select where two expression has and between the two' do
    select =  SqlBuilder::ConditionBuilder.new do
      append_and do
        equal "table_one.a", "table_two.b"
        equal "table_one.c", "table_two.d"
     end
     end
     expect(select.to_sql).to eq "(table_one.a = table_two.b AND table_one.c = table_two.d)"
  end

  it 'select or_where two expression has or between the two' do
    select = SqlBuilder::ConditionBuilder.new  do
      append_or do
        equal "table_one.a", "table_two.b"
        equal "table_one.c", "table_two.d"
      end
     end
     expect(select.to_sql).to eq "(table_one.a = table_two.b OR table_one.c = table_two.d)"
  end
  it 'select or_where two expression has or between the two' do
    select = SqlBuilder::ConditionBuilder.new  do
      append_or do
        append_and do
          equal "table_one.a", "table_two.b"
          equal "table_one.c", "table_two.d"
        end
        append_and do
          equal "table_one.e", "table_two.f"
          equal "table_one.g", "table_two.h"
        end
      end
     end
     expect(select.to_sql).to eq "((table_one.a = table_two.b AND table_one.c = table_two.d) OR (table_one.e = table_two.f AND table_one.g = table_two.h))"
  end
end
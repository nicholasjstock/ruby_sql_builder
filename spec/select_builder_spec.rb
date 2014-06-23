describe 'select builder' do
  it 'select where works' do
     select =  SqlBuilder::SelectBuilder[:col_one, :col_two].from[:table_one,:table_two].where do
        equal "table_one.a", "table_two.b"
      end
      expect(select.to_sql).to eq "SELECT col_one, col_two FROM table_one, table_two WHERE (table_one.a = table_two.b)"
  end
  
  it 'select where two expression has and between the two' do
    select =  SqlBuilder::SelectBuilder[:col_one, :col_two].from[:table_one,:table_two].where do
       equal "table_one.a", "table_two.b"
       equal "table_one.c", "table_two.d"
     end
     expect(select.to_sql).to eq "SELECT col_one, col_two FROM table_one, table_two WHERE (table_one.a = table_two.b AND table_one.c = table_two.d)"
  end
  
  it 'select or_where two expression has or between the two' do
    select =  SqlBuilder::SelectBuilder[:col_one, :col_two].from[:table_one,:table_two].or_where do
       equal "table_one.a", "table_two.b"
       equal "table_one.c", "table_two.d"
     end
     expect(select.to_sql).to eq "SELECT col_one, col_two FROM table_one, table_two WHERE (table_one.a = table_two.b OR table_one.c = table_two.d)"
  end
  
  xit 'nested and where or where' do
    select =  SqlBuilder::SelectBuilder[:col_one, :col_two].from[:table_one,:table_two].where do
      or_where do
         equal "table_one.a", "table_two.b"
         equal "table_one.c", "table_two.d"
       end
       or_where do
          equal "table_one.e", "table_two.f"
          equal "table_one.g", "table_two.h"
        end
     end
     
     
     expect(select.to_sql).to eq "SELECT col_one, col_two FROM table_one, table_two WHERE ((table_one.a = table_two.b OR table_one.c = table_two.d) AND (table_one.e = table_two.f OR table_one.g = table_two.h))"
  end
end
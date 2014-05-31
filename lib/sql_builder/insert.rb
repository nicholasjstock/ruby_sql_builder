module SqlBuilder
  class Insert
    attr_accessor :values, :table, :columns

    def initialize(hash = {})
      @table = hash[:table]
      @columns = hash[:columns] || []
      @values = hash[:values]
    end

    def to_columns
      @columns.collect do |column|
        "#{column.to_sql}"
      end.join(', ')
    end

    def to_values
      raise ArgumentError, "SqlBuilder Insert: values required" if !@values or @values.empty?
      @values.collect do |row|
        "#{row.collect(&:to_sql).join(', ')}"
      end.join(', ')
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Insert: table required" if !@table or @table.empty?

      result = "INSERT INTO #{@table.to_sql}"
      result += " (#{to_columns})" unless @columns.empty?
      result += " VALUES (#{to_values})"
    end
  end
end

module SqlBuilder
  class AndCondition 
    attr_accessor :conditions

    def initialize(hash = {})
      @conditions = hash[:conditions] unless hash.empty? or hash[:conditions].nil?
    end

    def to_sql
      raise ArgumentError, "SqlBuilder AndCondition: conditions cannot be missing or empty" if !@conditions or @conditions.empty?
      "(#{@conditions.collect(&:to_sql).join(' AND ')})"
    end
  end
end

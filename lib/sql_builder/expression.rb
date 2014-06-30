module SqlBuilder
  class Expression 
    attr_accessor :conditions

    def initialize(hash = {})
      @conditions = hash[:conditions] unless hash.empty? or hash[:conditions].nil?
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Expression: conditions cannot be missing or empty" if !@conditions or @conditions.empty?
      "(#{@conditions.collect(&:to_sql).join(' OR ')})"
    end
  end
end

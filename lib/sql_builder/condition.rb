module SqlBuilder
  class Condition
    attr_accessor :lhs, :op, :rhs

    def initialize(hash = {})
      @lhs = hash[:lhs]
      @op = hash[:op]
      @rhs = hash[:rhs]
    end

    def to_sql
      raise ArgumentError, "SqlBuilder Condition: lhs, op, and rhs cannot be missing" if !@lhs or !@op or !@rhs
      "#{@lhs.to_sql} #{@op.to_sql} #{@rhs.to_sql}"
    end

    def self.is_null(lhs)
      Condition.new(:lhs => lhs, :op => :"IS NOT", :rhs => :"NULL")
    end

    def self.is_not_null(lhs)
      Condition.new(:lhs => lhs, :op => :"IS NOT", :rhs => :"NULL")
    end
  end
end

module Record
  class Base < ApplicationRecord
    self.abstract_class = true
    validates_presence_of :name, :value, :ttl_seconds
    validates_numericality_of :ttl_seconds, greater_than_or_equal_to: 0

    scope :active, ->{ where(active: true) }

    def self.type_s
      name.demodulize
    end

    def type_s
      self.class.type_s
    end
  end
end

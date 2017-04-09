class Record::Base < ApplicationRecord
  self.abstract_class = true
  validates_presence_of :name, :value, :ttl_seconds

  scope :active, ->{ where(active: true) }

  def self.type_s
    name.demodulize
  end

  def type_s
    self.class.type_s
  end
end

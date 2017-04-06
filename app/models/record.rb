class Record < ApplicationRecord
  self.table_name = 'records'

  validates_presence_of :name, :value

  def self.type_s
    name.demodulize
  end

  def type_s
    self.class.type_s
  end
end

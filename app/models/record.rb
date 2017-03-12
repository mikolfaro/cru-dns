class Record < ActiveRecord::Base
  self.table_name = 'records'

  validates_presence_of :name, :value

  def type_s
    self.class.name.demodulize
  end
end

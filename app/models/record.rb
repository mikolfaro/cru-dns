class Record < ActiveRecord::Base
  self.table_name = 'records'

  validates_presence_of :name, :value
  validates_uniqueness_of :name, scope: :type
end

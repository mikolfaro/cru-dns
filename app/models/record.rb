class Record < ActiveRecord::Base
  self.table_name = 'records'
  self.abstract_class = true

  validates_presence_of :type, :name, :value
  validates_uniqueness_of :name, scope: :type
end

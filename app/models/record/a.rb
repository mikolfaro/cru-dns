class Record::A < Record
  validates_uniqueness_of :name, scope: :type
end

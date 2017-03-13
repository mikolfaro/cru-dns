class Record::A < Record
  validates_uniqueness_of :name, scope: :type

  def self.check(params)
    params.require(:record_a).permit(:name, :value, :ttl_seconds, :active)
  end
end

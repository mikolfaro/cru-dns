class Record::MX < Record
  validates_numericality_of :priority, greater_than_or_equal_to: 0

  def self.check(params)
    params.require(:record_mx).permit(:name, :value, :ttl_seconds, :active, :priority)
  end
end

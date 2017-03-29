module CruDns
  module MapBuilder
    def self.call
      {
        'A' => load_a_records,
        'MX' => load_mx_records
      }
    end

    private

    def self.load_a_records
      Record::A.all.map {|a_record| [a_record.name, a_record.value] }.to_h
    end

    def self.load_mx_records
      Record::MX.all.map do |mx_record|
        [mx_record.name, [mx_record.value, mx_record.priority]]
      end.to_h
    end
  end
end

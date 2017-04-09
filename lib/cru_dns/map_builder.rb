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
      Record::A.active.map {|a_record| [a_record.name, a_record.value] }.to_h
    end

    def self.load_mx_records
      Record::MX.active.map do |mx_record|
        [mx_record.name, [
          mx_record.priority,
          mx_record.value.split('.')
        ]]
      end.to_h
    end
  end
end

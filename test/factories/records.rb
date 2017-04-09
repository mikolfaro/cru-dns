FactoryGirl.define do
  factory :record_a, class: Record::A do
    name 'example.com'
    value '123.123.123.123'
    ttl_seconds 39600
    active true
  end

  factory :record_mx, class: Record::MX do
    name 'example.com'
    value 'mail.example.com'
    ttl_seconds 500
    active true
    priority 0
  end

  factory :inactive_record, class: Record::A do
    name 'inactive.org'
    value '123.234.34.56'
    ttl_seconds 39600
    active false
  end
end

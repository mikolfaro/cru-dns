FactoryGirl.define do
  factory :record_mx, class: Record::MX do
    name 'www.example.com'
    value '125.123.123.123'
    ttl_seconds 500
    active true
    priority 0
  end
end

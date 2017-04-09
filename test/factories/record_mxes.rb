FactoryGirl.define do
  factory :record_mx, class: Record::MX do
    name 'example.com'
    value 'mail.example.com'
    ttl_seconds 500
    active true
    priority 0
  end
end

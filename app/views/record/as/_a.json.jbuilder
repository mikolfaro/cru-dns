json.cache! record do
  json.extract! record, :id, :name, :value, :ttl_seconds,
                      :created_at, :updated_at
  json.type record.type_s
end

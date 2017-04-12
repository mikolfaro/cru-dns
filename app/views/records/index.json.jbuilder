json.cache! @records do
  json.records(@records) do |record|
    json.partial! record, record: record
  end
end

json.array!(@catch_rates) do |catch_rate|
  json.extract! catch_rate, :id
  json.url catch_rate_url(catch_rate, format: :json)
end

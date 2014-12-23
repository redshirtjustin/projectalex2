json.array!(@headlines) do |headline|
  json.extract! headline, :id
  json.url headline_url(headline, format: :json)
end

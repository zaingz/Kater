json.array!(@inavailabilities) do |inavailability|
  json.extract! inavailability, :id
  json.url inavailability_url(inavailability, format: :json)
end

json.array!(@catering_companies) do |catering_company|
  json.extract! catering_company, :id
  json.url catering_company_url(catering_company, format: :json)
end

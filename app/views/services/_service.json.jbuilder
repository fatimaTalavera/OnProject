json.extract! service, :id, :name, :description, :measurement_unit, :price, :created_at, :updated_at
json.url service_url(service, format: :json)

json.extract! material, :id, :name, :description, :price, :quantity, :minimun_stock, :measurement_unit, :created_at, :updated_at
json.url material_url(material, format: :json)

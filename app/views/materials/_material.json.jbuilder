json.extract! material, :id, :nombre, :descripcion, :unidad_medida, :cantidad, :precio, :stock_minimo, :created_at, :updated_at
json.url material_url(material, format: :json)

json.extract! employee, :id, :name, :last_name, :address, :email, :phone, :identification_document, :balance, :created_at, :updated_at
json.url employee_url(employee, format: :json)

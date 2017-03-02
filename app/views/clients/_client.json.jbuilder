json.extract! client, :id, :name, :last_name, :identification_document, :email, :adress, :phone, :created_at, :updated_at
json.url client_url(client, format: :json)

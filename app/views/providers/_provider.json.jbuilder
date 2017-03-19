json.extract! provider, :id, :name, :ruc, :address, :phone, :email, :state, :balance, :created_at, :updated_at
json.url provider_url(provider, format: :json)

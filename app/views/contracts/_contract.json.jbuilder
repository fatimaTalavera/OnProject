json.extract! contract, :id, :client_id, :start_date, :end_date, :name, :amount, :created_at, :attachment, :updated_at
json.url contract_url(contract, format: :json)

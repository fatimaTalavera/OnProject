json.extract! budget, :id, :client_id, :contract_id, :date, :description, :state, :total_amount, :created_at, :updated_at
json.url budget_url(budget, format: :json)

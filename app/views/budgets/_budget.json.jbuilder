json.extract! budget, :id, :client_id, :contract_id, :date, :description, :state, :total_amount, :measurement_unit, :created_at, :updated_at
json.url budget_url(budget, format: :json)

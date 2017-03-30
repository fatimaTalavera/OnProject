json.extract! budget, :id, :client_id, :date, :description, :utility, :state, :total_service, :total_material, :total_amount, :created_at, :updated_at
json.url budget_url(budget, format: :json)

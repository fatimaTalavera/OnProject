json.extract! sale_bill, :id, :date, :condition, :number, :client_id, :total, :created_at, :updated_at
json.url sale_bill_url(sale_bill, format: :json)

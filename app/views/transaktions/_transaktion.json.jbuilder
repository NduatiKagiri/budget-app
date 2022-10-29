json.extract! transaktion, :id, :name, :amount, :created_at, :updated_at
json.url transaktion_url(transaktion, format: :json)

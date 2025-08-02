json.extract! transaction, :id, :transaction_type, :amount, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

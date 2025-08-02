json.extract! account, :id, :full_name, :address, :phone, :national_id, :account_number, :balance, :status, :created_at, :updated_at
json.url account_url(account, format: :json)

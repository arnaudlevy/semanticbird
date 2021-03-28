json.extract! account, :id, :name, :identifier, :country, :image, :created_at, :updated_at
json.url account_url(account, format: :json)

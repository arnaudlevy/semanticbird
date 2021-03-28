json.extract! tweet, :id, :account_id, :url, :text, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)

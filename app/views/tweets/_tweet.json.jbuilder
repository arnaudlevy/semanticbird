json.extract! tweet, :id, :url, :text, :created_at, :updated_at
json.lexems tweet.lexems do |lexem|
  json.index lexem.index
  json.value lexem.value
  json.themes Theme.with_lexem(lexem) do |theme|
    json.id theme.id
    json.name theme.name
  end
end
json.url tweet_url(tweet, format: :json)

json.extract! tweet, :id, :url
json.text tweet.clean_text
json.account do
  json.name tweet.account.name
  json.path account_path(tweet.account)
end
json.themes tweet.themes do |theme|
  json.id theme.id
  json.name theme.name
  json.color theme.color
end
json.lexems tweet.lexems do |lexem|
  json.index lexem.index
  json.value lexem.value
  json.themes lexem.themes do |theme|
    json.id theme.id
    json.name theme.name
    json.color theme.color
  end
end

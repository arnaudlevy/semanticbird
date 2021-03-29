json.extract! tweet, :id, :url, :text
json.themes tweet.themes do |theme|
  json.id theme.id
  json.name theme.name
  json.parent theme.parent&.name
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

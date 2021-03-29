json.extract! theme, :id, :name, :color
json.children theme.children, partial: "themes/theme", as: :theme if theme.children.any?

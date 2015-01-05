json.array!(@theme_linkers) do |theme_linker|
  json.extract! theme_linker, :id, :theme, :description
  json.url theme_linker_url(theme_linker, format: :json)
end

json.array!(@genre_linkers) do |genre_linker|
  json.extract! genre_linker, :id, :genre, :description
  json.url genre_linker_url(genre_linker, format: :json)
end

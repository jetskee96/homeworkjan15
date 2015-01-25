json.array!(@movie_themes) do |movie_theme|
  json.extract! movie_theme, :id, :title, :description
  json.url movie_theme_url(movie_theme, format: :json)
end

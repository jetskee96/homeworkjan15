json.array!(@movie_theme_comments) do |movie_theme_comment|
  json.extract! movie_theme_comment, :id, :title, :description
  json.url movie_theme_comment_url(movie_theme_comment, format: :json)
end

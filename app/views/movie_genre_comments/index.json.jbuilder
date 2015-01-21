json.array!(@movie_genre_comments) do |movie_genre_comment|
  json.extract! movie_genre_comment, :id, :title, :description
  json.url movie_genre_comment_url(movie_genre_comment, format: :json)
end

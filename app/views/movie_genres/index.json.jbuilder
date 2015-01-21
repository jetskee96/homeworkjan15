json.array!(@movie_genres) do |movie_genre|
  json.extract! movie_genre, :id, :title, :description
  json.url movie_genre_url(movie_genre, format: :json)
end

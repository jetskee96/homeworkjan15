class MovieGenre < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :movie_genre_comments
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end

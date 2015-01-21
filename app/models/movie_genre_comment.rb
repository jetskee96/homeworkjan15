class MovieGenreComment < ActiveRecord::Base
  belongs_to :movie_genre
  
    has_reputation :votes, source: :user, aggregated_by: :sum
end

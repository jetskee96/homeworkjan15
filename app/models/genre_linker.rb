class GenreLinker < ActiveRecord::Base
   belongs_to :user
   belongs_to :movie
   
   has_reputation :votes, source: :user, aggregated_by: :sum
end

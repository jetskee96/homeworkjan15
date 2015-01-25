class MovieGenre < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :movie_genre_comments
  

  has_reputation :votes, source: :user, aggregated_by: :sum
  
#  scope :similar_themes, 
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end 
  
#  def self.similar_theme
#    @similar_themes = MovieTheme ->(movie_theme) { where("id != ? and movie_theme_id = ?", movie_theme.id, movie_theme.movie_theme_id) }  
 # end

end

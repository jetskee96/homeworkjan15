class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :movies
  has_many :movie_genres
  has_many :movie_themes
   attr_accessor :login
   has_reputation :votes, source: {reputation: :votes, of: :movies}, aggregated_by: :sum  
end

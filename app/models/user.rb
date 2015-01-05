class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :movies
   has_many :genre_linkers
   has_many :theme_linkers
   has_reputation :votes, source: {reputation: :votes, of: :movies}, aggregated_by: :sum  
end

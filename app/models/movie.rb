class Movie < ActiveRecord::Base
   belongs_to :user
   has_many :movie_genres
   has_many :movie_themes
   has_many :movie_locations
   has_many :movie_characters
   has_many :movie_brands
   has_many :movie_goofs
   has_many :movie_references
   has_many :movie_songs
   has_many :movie_technicals
   has_many :movie_quotes

   
   has_attached_file :poster, styles: { medium: "350x500#" }
   validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
   
end

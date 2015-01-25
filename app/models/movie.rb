class Movie < ActiveRecord::Base
   belongs_to :user
   has_many :movie_genres
   has_many :movie_themes

   
   has_attached_file :poster, styles: { medium: "350x500#" }
   validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
   
end

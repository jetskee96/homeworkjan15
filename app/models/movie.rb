class Movie < ActiveRecord::Base
   belongs_to :user
   has_many :genre_linkers
   
   has_attached_file :poster, styles: { medium: "400x600#" }
   validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
   
end

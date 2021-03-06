require 'elasticsearch/model'
class MovieTheme < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  belongs_to :movie
  has_many :movie_theme_comments
  
  has_reputation :votes, source: :user, aggregated_by: :sum
 
  def self.popular
    reorder('votes desc').order('created_at DESC').find_with_reputation(:votes, :all)
  end  
  
end
MovieTheme.import
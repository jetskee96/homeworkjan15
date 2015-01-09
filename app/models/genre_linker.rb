require 'elasticsearch/model'
class GenreLinker < ActiveRecord::Base
   belongs_to :user
   belongs_to :movie
   include Elasticsearch::Model
   include Elasticsearch::Model::Callbacks
   
   has_reputation :votes, source: :user, aggregated_by: :sum
end
GenreLinker.import # for auto sync model with elastic search
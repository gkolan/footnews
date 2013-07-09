class Article < ActiveRecord::Base
  belongs_to :feed
  attr_accessible :guid, :name, :published_at, :summary, :url, :feed_id
end

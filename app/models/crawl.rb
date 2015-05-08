class Crawl < ActiveRecord::Base
	belongs_to :user
	has_many :bars
	has_many :locations, :through => :bars
end

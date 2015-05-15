class Bar < ActiveRecord::Base
	#join table for crawls and locations
	belongs_to :crawl
	belongs_to :location
end

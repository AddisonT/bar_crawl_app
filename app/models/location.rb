class Location < ActiveRecord::Base
	has_many :bars
	has_many :crawls, :through => :bars
end

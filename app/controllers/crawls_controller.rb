class CrawlsController < ApplicationController
	def index
  	end

  	def search
    	parameters = { limit: 20,
    					sort: 2,
    					category_filter: "bar",
    					radius_filter: 500 }
    	render json: Yelp.client.search('94104', parameters)
  	end
end

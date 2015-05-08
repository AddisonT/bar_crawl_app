class CrawlsController < ApplicationController
	def index
  	end

  	def search
    	parameters = { limit: 20,
    					sort: 2,
    					category_filter: "bars",
    					radius_filter: 500 }
    	location = params[:location]

    	if location
			var = Yelp.client.search(location, parameters) 
			@bars = var.businesses 
    	end

  	end

    def map
      render :map
    end
end

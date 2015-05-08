class CrawlsController < ApplicationController
	def index
  end

	def search
  	parameters = { limit: 10,
  					sort: 1,
  					category_filter: "bars",
  					radius_filter: 10000 }
            # where: { businesses.review_count > 10 && businesses.rating >= 2.5 } }
  	location = params[:loc]

  	if location
		  var = Yelp.client.search(location, parameters) 
		  @bars = var.businesses 
  	end

	end

  def create
    #byebug

    @locations = params.require(:locations)[:bars]

    render :crawl
  end
end

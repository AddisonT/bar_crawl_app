class CrawlsController < ApplicationController
	def index
  end

<<<<<<< HEAD
  def search
  	parameters = { limit: 10,
     sort: 1,
     category_filter: "bars",
     radius_filter: 10000 }
=======
	def search
  	parameters = { limit: 5,
  					sort: 1,
  					category_filter: "bars",
  					radius_filter: 10000 }
>>>>>>> 2427bc6ec91a0e386139f8c33ba7157f12ece025
            # where: { businesses.review_count > 10 && businesses.rating >= 2.5 } }
    location = params[:loc]

    if location
      var = Yelp.client.search(location, parameters) 
      @bars = var.businesses 
    end

  end

  def create
    #byebug

    @user = current_user

    @results = params.require(:locations)[:bars]
    @name = params.require(:locations).permit(:crawl)["crawl"]

    @all_locations = []
    city = ""
    crawlAddress = @results[0].split(" | ")
    crawlCity = crawlAddress[1].split(", ")
    @crawl = @user.crawls.create(name: @name, city: crawlCity[1])
    @results.each do |x| 
      temp = []
      stuff = x.split(" | ")
      city = stuff[1].split(", ")[1]
      temp << stuff[0] #bar id
      temp << stuff[1] #address
      temp << stuff[2] #bar name
      temp << stuff[3].to_f #lat
      temp << stuff[4].to_f #lng
      @all_locations << temp
      @crawl.locations << Location.find_or_create_by(address: stuff[1], lat: stuff[3].to_f, lng: stuff[4].to_f, name: stuff[2], business_id: stuff[0])
    end

    render :crawl
  end

  def map
    render :map
  end

end


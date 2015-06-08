class CrawlsController < ApplicationController
  before_action :authenticate_user!
	def index
  end

	def search
    @user = current_user
  	parameters = { limit: 20,
  					sort: 1,
  					category_filter: "bars",
  					radius_filter: 5000 }
            # where: { businesses.review_count > 10 && businesses.rating >= 2.5 } }
    @location = params[:loc]

    #regex to only take in a 5 digit zipcode to do a yelp search
    if /\A\d{5}\z/.match(@location)
      @bars = Yelp.client.search(@location, parameters) 
      # @bars = var.businesses

      respond_to do |format|
        format.html
        format.json { render json: @bars }
      end
    else
      flash[:error] = "Invalid Zip Code"
    end

  end

  def create
    #byebug

    @user = current_user
    #bars that were checked in the search results
    @results = params.require(:locations)[:bars]
    @name = params.require(:locations).permit(:crawl)["crawl"]

    @all_locations = []
    city = ""
    crawlAddress = @results[0].split(" | ")
    crawlCity = crawlAddress[1].split(", ")
    @crawl = @user.crawls.create(name: @name, city: crawlCity[1])
    @results.each do |x| 
      # temp = []
      stuff = x.split(" | ")
      # city = stuff[1].split(", ")[1]
      # temp << stuff[0] #bar id
      # temp << stuff[1] #address
      # temp << stuff[2] #bar name
      # temp << stuff[3].to_f #lat
      # temp << stuff[4].to_f #lng
      # #all locations is for rendering the data of the selected bars
      # @all_locations << temp
      @crawl.locations << Location.find_or_create_by(address: stuff[1], lat: stuff[3].to_f, lng: stuff[4].to_f, name: stuff[2], business_id: stuff[0])
      end

     redirect_to "/users/#{@user.id}/crawls/#{@crawl.id}"
  end

  def show
    @user = current_user
    @crawl_id = params[:id]
    @user_crawl = @user.crawls.find(@crawl_id)
    @bars = @user_crawl.locations
    @images = []
    @bars.each do |b|
      #yelp search by business ID
      image = b.img_url
      @images << image
    end
    # @name = @user_crawl.locations[0].name
    # @address = @user_crawl.locations[0].address
# byebug

    render :crawl
  end

  def map
    @user = current_user
    @crawl = @user.crawls.find(params[:crawl_id])
    @loc = @crawl.locations
    respond_to do |format|
      format.html
      format.json {render json: @loc}
    end
    # render :map
  end

end


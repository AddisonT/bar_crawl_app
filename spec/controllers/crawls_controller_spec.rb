require "rails_helper"

RSpec.describe CrawlsController, :type => :controller do
	describe "GET #map" do
		it "renders the map template" do
		    get :map
		    expect(response).to render_template("map")
		end

	end

	describe "GET #search" do
		it "renders the search template" do
		    get :search
		    expect(response).to render_template("search")
		end
	
		it "respond with return 200 status" do
			get :search
			# expect(respond).to be_success
			expect(response).to have_http_status(200)
		end
	end

	describe "POST #crawl" do
		it "renders the crawl template" do
		    post :crawl
		   expect(response).to render_template("crawl")
		end
	end
	

end
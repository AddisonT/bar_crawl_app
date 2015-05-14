require "rails_helper"

RSpec.describe CrawlsController, :type => :controller do

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

end
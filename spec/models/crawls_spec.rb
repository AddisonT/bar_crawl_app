require 'rails_helper'
# require "spec_helper"

RSpec.describe Crawl, :type => :model do

	it "belongs to a user" do
	  crawl = Crawl.new
	  user = User.new
	  user.crawls << crawl
	  expect(crawl.user).to be user
	end
end

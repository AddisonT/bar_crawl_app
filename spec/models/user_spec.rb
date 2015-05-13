require 'rails_helper'
# require "spec_helper"

RSpec.describe User, :type => :model do
	# pending "add some examples to (or delete) #{__FILE__}"

	it "create a new user" do
		user = build(:user)
		expect(user).to be_instance_of User
	end

	# it "test for salty password" do
	# 	user = User.new
	# end

end
require 'rails_helper'
# require "spec_helper"

RSpec.describe User, :type => :model do
	# pending "add some examples to (or delete) #{__FILE__}"
	before { @user = User.new(name: "Example_User", email: "user@example.com", password: "foobar123", password_confirmation: "foobar123") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	# it "create a new user" do
	# 	taco = build(:user)
	# 	expect(taco).to be_instance_of User
	# end

	it "create a new user" do
		user = build(:user)
		expect(user).to be_valid
	end

	# describe 'when name is not present' do
	#    before { @user.name = " " }
	#    it { should_not be_valid }
	# end

	describe 'when email is not present' do
	   before { @user.email = " " }
	   it { should_not be_valid }
	end

	describe 'when password is not present' do
	   before { @user.password = " " }
	   it { should_not be_valid }
	end

end
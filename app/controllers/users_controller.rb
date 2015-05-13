class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def index
  	@user = current_user
  	render :index
  end

  def show
  end
end

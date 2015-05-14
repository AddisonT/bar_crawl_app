class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def new
  end

  def edit
  end

  def index
  	@user = current_user
  	render :index
  end

  def show
    unless user_signed_in?
      redirect_to root_path
    else
      @user = current_user
      @crawls = @user.crawls

      render :show
    end
  end
end

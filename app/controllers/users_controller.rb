class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.includes(:friendships).page params[:page]
  end
end

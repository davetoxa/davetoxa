class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.page params[:page]
  end
end

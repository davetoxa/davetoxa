class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(resource_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def resource_params
    @resource_params ||= params.require(:user).permit(:name, :info)
  end
end

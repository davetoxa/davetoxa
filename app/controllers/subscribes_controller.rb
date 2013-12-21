class SubscribesController < ApplicationController
  respond_to :html

  before_filter :load_subscriber, only: :create
  load_and_authorize_resource

  def index
    @subscribes = @subscribes.page(params[:page]).per_page(10)
  end

  def new
  end

  def create
    flash[:notice] = 'You have successfully subscribed' if @subscribe.save
    respond_with @subscribe, location: root_path
  end

  def destroy
    @subscribe.destroy
    respond_with @subscribe, location: subscribes_path
  end

  private

  def load_subscriber
    @subscribe = Subscribe.new(recourse_params)
  end

  def recourse_params
    params.require(:subscribe).permit(:email)
  end

end

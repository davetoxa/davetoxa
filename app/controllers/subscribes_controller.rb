class SubscribesController < ApplicationController
  respond_to :html

  before_action :load_subscriber, only: :create
  load_and_authorize_resource

  def index
    @subscribes = @subscribes.page params[:page]
  end

  def new
  end

  def create
    flash[:notice] = I18n.t('controllers.subscribes.subscribe_successful') if @subscribe.save
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

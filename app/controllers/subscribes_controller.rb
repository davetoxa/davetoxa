class SubscribesController < ApplicationController
  respond_to :html
  responders :flash

  before_filter :load_subscriber, only: :create
  load_and_authorize_resource

  def show
    @subscribes = @subscribes.page(params[:page]).per_page(10)
  end

  def new
  end

  def create
    flash[:notice] = 'Вы успешно подписались' if @subscribe.save
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

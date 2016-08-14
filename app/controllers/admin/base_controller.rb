class Admin::BaseController < ApplicationController
  before_action :check!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private
  
  def check!
    redirect_to root_url, alert: 'Access denied' unless current_user && current_user.admin?
  end
end

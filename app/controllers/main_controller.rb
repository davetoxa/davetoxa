class MainController < ApplicationController
  def plan
  end
  def admin
    redirect_to root_url, alert: 'Access denied' unless current_user && current_user.admin?
  end
end

class SearchController < ApplicationController
  def show
    @search = params[:search]
    @result = User.where(
      'name ilike :q or username ilike :q', q: "%#{@search}%"
    ).order(created_at: :desc)
  end
end

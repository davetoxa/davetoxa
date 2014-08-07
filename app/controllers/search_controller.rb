class SearchController < ApplicationController
  def show
    @search = params[:search]
    @result = Post.where(
      'title ilike :q or content ilike :q', q: "%#{@search}%"
    ).order(created_at: :desc)
  end
end

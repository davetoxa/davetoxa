class SearchController < ApplicationController
  def show
    @search = params[:search]
    @result = Post.basic_search({content: @search, title: @search}, false)
  end
end

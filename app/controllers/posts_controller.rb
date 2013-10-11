class PostsController < ApplicationController
  respond_to :html

  before_filter :load_post, only: :create
  load_and_authorize_resource

  def index
    @posts = @posts.order(created_at: :desc).page(params[:page]).per_page(10)
  end

  def show

  end

  def new
  end

  def edit
  end

  def create
    @post = current_user.posts.create(recourse_params)
    respond_with @post, location: posts_path
  end

  def update
    @post.update(recourse_params)
    respond_with @post, location: @post
  end

  def destroy
    @post.destroy
    respond_with @post, location: posts_path
  end

  private

  def load_post
    @post = Post.new(recourse_params)
  end

  def recourse_params
    params.require(:post).permit(:title, :content)
  end
end

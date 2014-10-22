class CommentsController < ApplicationController
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post

  def create
    render @post.comments.create(comment_params.merge(user: current_user))
  end

  def destroy
    @comment.destroy
    render json: { id: @comment.id }
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

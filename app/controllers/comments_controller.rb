class CommentsController < ApplicationController
  before_action :set_comment, only: [ :destroy ]

  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end

    redirect_to blog_post_path(params[:blog_post_id])
  end

  def destroy
    @comment.destroy
    redirect_to blog_post_path(params[:blog_post_id]), notice: "Comment was successfully deleted."
  end

  def comment_user
    @comment_user = User.where(user_id: comment.id).includes(:user)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(blog_post_id: params[:blog_post_id])
  end
end

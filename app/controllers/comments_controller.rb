class CommentsController < ApplicationController
  def index

  end

  def show

  end

  def new
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user if current_user
    if @comment.save
      flash.now[:success] = "You've made a comment on #{@comment.post.title}"
    else
      flash.now[:danger] = "Comment failed to post"
    end
  end

  def update

  end

  def destroy

  end

  private
    def comment_params
      params.require(:comment).permit(:description, :user)
    end
end

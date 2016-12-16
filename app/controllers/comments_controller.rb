class CommentsController < ApplicationController

  def create
    @comment = Comment.new(secure_params)
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user if current_user

    if @comment.save
      flash[:success] = "Thanks for commenting"
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js #we'll use this later for AJAX!
      end
    else
      flash[:danger] = "Comment failed to go through"
      redirect_to posts_path
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.post = Post.find(params[:post_id])
    @comment.destroy
    flash[:danger] = "comment deleted"
    redirect_to posts_path
  end

  private
    def secure_params
      params.require(:comment).permit(:description, :user)
    end

end

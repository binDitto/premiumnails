class CommentsController < ApplicationController

  def create
    id = params[:post_id] || params[:service_id]
    if params[:post_id]
      @parent = Post.find(id)
    elsif params[:service_id]
      @parent = Service.find(id)
    end

    @comment = @parent.comments.new(secure_params)
    @comment.user = current_user if current_user

    if @comment.save
      flash[:success] = "Thanks for commenting"
      respond_to do |format|
        if params[:post_id]
          format.html { redirect_to posts_path }
        elsif params[:service_id]
          format.html { redirect_to services_path }
        end
        format.js #we'll use this later for AJAX!
      end
    else
      flash[:danger] = "Comment failed to go through"
      if @parent = Post.find(id)
        redirect_to posts_path
      else
        redirect_to services_path
      end
    end

  end

  def destroy
    id = params[:post_id] || params[:service_id]
      if params[:post_id]
        @parent = Post.find(id)
      elsif params[:service_id]
        @parent = Service.find(id)
      end
    @comment = @parent.comments.find(params[:id])
    @comment.destroy
    flash[:danger] = "comment deleted"
    if params[:post_id]
     redirect_to posts_path
    elsif params[:service_id]
     redirect_to service_path(Service.find(params[:service_id]))
    end

  end

  private
    def secure_params
      params.require(:comment).permit(:description, :user)
    end

end

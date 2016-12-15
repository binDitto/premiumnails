class PostsController < ApplicationController
  before_action :set_post, only: [ :edit, :update, :show, :destroy ]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 6)

    @posts.each do |p|
      @new = p.comments.create(comment_params)
      @new.user = current_user if current_user
      if @new.save
        flash.now[:success] = "Thanks for commenting"
      else
        flash.now[:danger] = "Comment failed"
      end
    end

  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "You have successfully posted to the Bulletin Board"
      redirect_to posts_path
    else
      flash[:danger] = "Your post didn't go through"
      render 'new'
    end



  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:success] = "You've successfully updated your post"
      redirect_to posts_path
    else
      flash[:danger] = "Your update didn't go through"
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @post.destroy
    flash[:danger] = "Post deleted"
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end

    def comment_params
      params.permit(:description, :user, :post)
    end

end

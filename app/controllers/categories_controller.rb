class CategoriesController < ApplicationController

  before_action :def_category, only: [ :edit, :update, :show, :destroy ]

  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to categories_path
    else
      flash[:danger] = "Category failed to save"
      render 'new'
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category updated"
      redirect_to category_path(@category)
    else
      flash[:danger] = "Update failed"
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @category.destroy
    flash[:danger] = "Category removed"
    redirect_to categories_path
  end

    private
      def category_params
        params.require(:category).permit(:name)
      end

      def def_category
        @category = Category.find(params[:id])
      end
end

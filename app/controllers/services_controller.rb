class ServicesController < ApplicationController
  before_action :def_service, only: [ :edit, :update, :show, :destroy ]

  def index
    @services = Service.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @service = Service.new()
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      flash[:success] = "Service added"
      redirect_to services_path
    else
      flash[:danger] = "Service had a problem"
      render 'new'
    end

  end

  def edit

  end

  def update
    if @service.update(service_params)
      flash[:success] = "Service updated"
      redirect_to services_path
    else
      flash[:danger] = "Service couldn't update"
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @service.destroy
    flash[:danger] = "Service removed"
    redirect_to services_path
  end

  private
    def service_params
      params.require(:service).permit(:name, :description, :price)
    end

    def def_service
      @service = Service.find(params[:id])
    end
end

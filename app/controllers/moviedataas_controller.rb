class MoviedataasController < ApplicationController
before_action :authenticate_user! , only: [:new, :create, :edit, :destroy, :update]
before_action :find_moviedataa_and_check_permission, only: [:edit, :update,:destroy]

  def index
    @moviedataas = Moviedataa.all
  end

  def new
    @moviedataa = Moviedataa.new
  end

  def create
    @moviedataa = Moviedataa.new(moviedataa_params)
    @moviedataa.user = current_user
    if  @moviedataa.save
      redirect_to moviedataas_path
    else
      render :new
    end
  end

  def show
    @moviedataa = Moviedataa.find(params[:id])
    @posts = @moviedataa.posts.recent.paginate(:page => params[:page],:per_page => 5)
  end

  def edit
  end

  def update
    if @moviedataa.update(moviedataa_params)
      redirect_to moviedataas_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @moviedataa.destroy
    flash[:alert] = "Movie deleted"
    redirect_to moviedataas_path
  end


  private

  def find_moviedataa_and_check_permission
    @moviedataa = Moviedataa.find(params[:id])
    if current_user != @moviedataa.user
      redirect_to root_path, alert:"You have no permission."
    end
  end

  def moviedataa_params
    params.require(:moviedataa).permit(:title, :description)
  end
end

class MoviedataasController < ApplicationController
before_action :authenticate_user! , only: [:new, :create]

  def index
    @moviedataas = Moviedataa.all
  end

  def new
    @moviedataa = Moviedataa.new
  end

  def create
    @moviedataa = Moviedataa.new(moviedataa_params)
    if  @moviedataa.save
      redirect_to moviedataas_path
    else
      render :new
    end
  end

  def show
    @moviedataa = Moviedataa.find(params[:id])
  end

  def edit
    @moviedataa = Moviedataa.find(params[:id])
  end

  def update
    @moviedataa = Moviedataa.find(params[:id])
    if @moviedataa.update(moviedataa_params)
      redirect_to moviedataas_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @moviedataa = Moviedataa.find(params[:id])
    @moviedataa.destroy
    flash[:alert] = "Movie deleted"
    redirect_to moviedataas_path
  end


  private

  def moviedataa_params
    params.require(:moviedataa).permit(:title, :description)
  end
end

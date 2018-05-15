class MoviedataasController < ApplicationController
  def index
    @moviedataas = Moviedataa.all
  end

  def new
    @moviedataa = Moviedataa.new
  end

  def create
    @moviedataa = Moviedataa.new(moviedataa_params)
    @moviedataa.save
    redirect_to moviedataas_path
  end

  def edit
    @moviedataa = Moviedataa.find(params[:id])
  end

  def update
    @moviedataa = Moviedataa.find(params[:id])
    @moviedata.update(moviedataa_params)
    redirect_to moviedataas_path, notice: "Update Success"
  end

  private

  def moviedataa_params
    params.require(:moviedataa).permit(:title, :description)
  end
end

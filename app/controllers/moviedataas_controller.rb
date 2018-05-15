class MoviedataasController < ApplicationController
  def index
    @moviedataas = Moviedataa.all
  end
end

class Account::MoviedataasController < ApplicationController
  before_action :authenticate_user!

  def index
    @moviedataas = current_user.participated_moviedataas
  end
end

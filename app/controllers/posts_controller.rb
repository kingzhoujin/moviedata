class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,:destroy]

    def new
      @moviedataa = Moviedataa.find(params[:moviedataa_id])
      @post = Post.new
    end

    def create
      @moviedataa = Moviedataa.find(params[:moviedataa_id])
      @post = Post.new(post_params)
      @post.moviedataa = @moviedataa
      @post.user = current_user
      if @post.save
        redirect_to moviedataa_path(@moviedataa)
      else
        render :new
      end
    end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end

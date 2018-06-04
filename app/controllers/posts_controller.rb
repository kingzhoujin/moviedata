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

    def edit
      @moviedataa = Moviedataa.find(params[:moviedataa_id])
      @post = Post.find(params[:id])
    end

    def update
      @moviedataa = Moviedataa.find(params[:moviedataa_id])
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to account_posts_path, notice: "Post Update Success!"
      else
        render :edit
      end
    end

    def destroy
      @moviedataa = Moviedataa.find(params[:moviedataa_id])
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to account_posts_path, alert: " Post Delete!"
    end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end

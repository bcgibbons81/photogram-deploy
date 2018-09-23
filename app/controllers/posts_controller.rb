class PostsController < ApplicationController
  #before_action :owned_post, only: [:edit, :update, :destroy]

def index
	@posts = Post.all
end

def new
	@post = Post.new
end

def create
    @post = Post.new(post_params)
    @post['user_id'] = current_user.id
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to posts_path
    else
      flash[:alert] = "Your post was not created! Please check the form and try again."
      render :new
    end
end

def show
  @post = Post.find(params[:id])
end

def edit
	@post = Post.find(params[:id])
  
end

def update
  if @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
    flash[:success] = "Post updated."
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
end



def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to root_path
end
  
private

def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name, :avatar, :bio)
  end
  
def post_params
    params.require(:post).permit(:caption, :image, :user)
end

def set_post
    @post = Post.find(params[:id])
end







end



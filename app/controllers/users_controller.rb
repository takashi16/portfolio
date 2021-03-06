class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@blogs = @user.blogs
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to blogs_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end
end

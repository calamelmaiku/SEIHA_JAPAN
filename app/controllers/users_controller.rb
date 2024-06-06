class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @groups = Group.all
    @user_groups = @user.groups
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

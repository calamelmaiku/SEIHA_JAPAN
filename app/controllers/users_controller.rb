class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @groups = Group.all
    @group_completion_rates = calculate_group_completion_rates(@user)
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

  def calculate_group_completion_rates(user)
    group_completion_rates = {}

    Group.all.each do |group|
      group_completion_rates[group.name] = calculate_completion_rate(user, group.spots)
    end

    group_completion_rates
  end

  def calculate_completion_rate(user, spots)
    total_spots = spots.count
    visited_spots = spots.joins(:visiteds).where(visiteds: { visited: true, user_id: user.id }).count
    total_spots > 0 ? (visited_spots.to_f / total_spots * 100).round(2) : 0
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end


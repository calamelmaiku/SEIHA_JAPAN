class Admin::SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_group, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_spot, only: [:edit, :update, :destroy]

  def new
    @spot = @group.spots.new
  end

  def create
    @spot = @group.spots.new(spot_params)
    if @spot.save
      redirect_to admin_group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to admin_group_path(@group)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spot.destroy
    redirect_to admin_group_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_spot
    @spot = @group.spots.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :text, :address, :latitude, :longitude)
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end

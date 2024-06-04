class Admin::SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_group
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def new
    @spot = @group.spots.new
  end

  def create
    @spot = @group.spots.new(spot_params)
    if @spot.save
      redirect_to admin_group_path(@group), notice: 'Spot was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to admin_group_path(@group), notice: 'Spot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to admin_group_path(@group), notice: 'Spot was successfully deleted.'
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
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end
end

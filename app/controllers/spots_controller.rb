class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_group, only: [:show]
  before_action :set_spot, only: [:show]

  def show
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_spot
    @spot = @group.spots.find(params[:id])
  end
end

class SpotsController < ApplicationController
  before_action :set_group
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

class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @spots = @group.spots
  end
end

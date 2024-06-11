class Admin::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_groups_path(@group), notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to admin_groups_path(@group), notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_path, notice: 'Group was successfully deleted.'
  end

  private

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end

  def group_params
    params.require(:group).permit(:name, :creator, :text)
  end
end

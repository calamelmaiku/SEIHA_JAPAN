class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @groups = Group.all
    @group_completion_rates = calculate_group_completion_rates if user_signed_in?
  end

  def show
    @group = Group.find(params[:id])
    @spots = @group.spots
    @completion_rate = calculate_completion_rate(@spots)
    @use_google_maps = true
  end

  private

  def calculate_group_completion_rates
    group_completion_rates = {}

    @groups.each do |group|
      group_completion_rates[group.id] = calculate_completion_rate(group.spots)
    end

    group_completion_rates
  end

  def calculate_completion_rate(spots)
    total_spots = spots.count
    visited_spots = spots.joins(:visiteds).where(visiteds: { visited: true, user_id: current_user.id }).count
    total_spots > 0 ? (visited_spots.to_f / total_spots * 100).round(2) : 0
  end
end

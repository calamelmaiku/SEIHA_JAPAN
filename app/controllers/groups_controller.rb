class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @spots = @group.spots

     # グループの全スポット数
     total_spots = @spots.count

     # 訪問済みスポット数
     visited_spots = @spots.joins(:visiteds).where(visiteds: { visited: true, user_id: current_user.id }).count
 
     # 達成率の計算（スポットが0の場合は0%）
     @completion_rate = total_spots > 0 ? (visited_spots.to_f / total_spots * 100).round(2) : 0
  end
end

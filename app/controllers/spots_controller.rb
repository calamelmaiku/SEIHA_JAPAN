class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :toggle_visited]
  before_action :set_group_and_spot, only: [:show, :toggle_visited]

  def show
    # 現在のユーザーがこのスポットを訪問したかどうかを確認
    @visited = @spot.visiteds.find_or_initialize_by(user: current_user)
    @use_google_maps = true
  end

  # スポットの訪問状態をトグルするアクション
  def toggle_visited
    # 現在の訪問状態を切り替え
    @visited = @spot.visiteds.find_or_initialize_by(user: current_user)
    @visited.visited = !@visited.visited

    if @visited.save
      redirect_to group_spot_path(@group, @spot), notice: '訪問状態が更新されました。'
    else
      redirect_to group_spot_path(@group, @spot), alert: '訪問状態の更新に失敗しました。'
    end
  end

  private

  # グループとスポットを設定するメソッド
  def set_group_and_spot
    @group = Group.find(params[:group_id])
    @spot = Spot.find(params[:id])
  end
end

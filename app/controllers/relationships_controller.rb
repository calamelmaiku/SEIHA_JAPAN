class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    if user != current_user
      current_user.follow(user)
      redirect_to user
    else
      redirect_to user, alert: "自分自身をフォローすることはできません。"
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end

class RelationshipsController < ApplicationController

  def follow
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

end

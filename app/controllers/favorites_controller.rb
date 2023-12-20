class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav_post(micropost)
    flash[:success] = 'この投稿をお気に入りにしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfav_post(micropost)
    flash[:success] = 'この投稿をお気に入りから解除しました。'
    redirect_back(fallback_location: root_path)
  end

  
end

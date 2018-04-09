class FavoritesController < ApplicationController
  before_action :require_user_logged_in
    
  def create
    ###
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    # current_user.favorite(params[:micropost_id])
    flash[:success] = '投稿をお気に入りに登録しました。'
    redirect_back(fallback_location:root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_back(fallback_location:root_path)
  end
end

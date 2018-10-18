class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'Micropostをお気に入りに追加しました。'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.dislike(micropost)
    flash[:success] = 'Micropostをお気に入りから削除しました。'
    redirect_to :back
  end
end

class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'いいねしました'
    else
      redirect_to topics_path, danger: 'いいねに失敗しました'
    end
  end
end

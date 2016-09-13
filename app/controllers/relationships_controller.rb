class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    follow = current_user.relationships.build(following_id: @user.id)
    if follow.save
        redirect_to posts_path, notice: "フォローしました"
    else
        redirect_to posts_path, alert: "フォローできません"
    end
  end

  def destroy
    follow = current_user.relationships.find_by!(following_id: @user.id)
    follow.destroy
    redirect_to posts_url, notice: "フォロー解除しました"
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end
end

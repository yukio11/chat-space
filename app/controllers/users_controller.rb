class UsersController < ApplicationController
  def search
    @users = User.where.not(id: current_user.id).where('name LIKE(?)', "%#{user_params[:keyword]}%")
    # current_userを検索結果に表示しない
    respond_to do |format|
      format.html
      format.json
    end
  end

  def user_params
    params.permit(:keyword)
  end
end

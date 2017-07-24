class UsersController < ApplicationController
  def search
    @users = User.where('name LIKE(?)', "%#{user_params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def user_params
    params.permit(:keyword)
  end
end

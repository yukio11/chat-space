class MessagesController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to group_path(params[:group_id])
  end

  private
  def message_params
    params.require(:message).permit(:body ,:image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

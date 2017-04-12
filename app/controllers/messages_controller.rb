class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @members = @group.users.map{|user| user[:name]}.join(' ')
    @user = current_user
    @groups = current_user.groups
    @messages = @group.messages
    @message = Message.new
  end

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

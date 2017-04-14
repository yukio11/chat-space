class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @members = @group.users.map{|user| user[:name]}.join(' ')
    @user = current_user
    @groups = current_user.groups
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.valid?
      redirect_to group_messages_path(params[:group_id])
    else
      flash[:notice] = "メッセージを入力してください"
      redirect_to group_messages_path(params[:group_id])
    end
  end

  private

  def message_params
    params.require(:message).permit(:body ,:image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

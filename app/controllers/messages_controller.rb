class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @members = @group.users.map{|user| user[:name]}.join(' ')
    @message = Message.new
    @message.user_id = current_user.id

  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.group = Group.find(params[:group_id])
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(params[:group_id])}
        format.json
      end
    else
      flash[:notice] = "メッセージを入力してください"
      redirect_to group_messages_path(params[:group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:body ,:image, :user_id).merge(group_id: params[:group_id])
  end
end

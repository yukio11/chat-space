class MessagesController < ApplicationController

before_action :set_message, only: [:edit, :update]
  def index
    @messages = Message.where(group_id: params[:group_id])
  end

  def show
  end

  def new
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @group = Message.create(message_params)
  end

  def edit
  end

  def update
    @message.update(message_params)
  end

  def delete
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :group_id, :user_id).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
    @group = Group.find(params[:group_id])
  end
end

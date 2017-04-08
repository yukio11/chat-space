class GroupsController < ApplicationController

  before_action :set_group, only:[:edit, :update]

  def show
    @group = Group.find(params[:id])
  end
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to group_path(@group), notice: "グループ作成が完了しました。"
    else
      flash.now[:alert] = "グループの作成に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    if @group.save
      redirect_to group_path(@group), notice:"グループの更新が完了しました。"
    else
      flash.now[:alert] = "グループの更新に失敗しました。"
      render :edit
    end
  end


  private
  def group_params
    params.require(:group).permit(:name,{ user_ids: []})
  end

  def set_group
    @group = Group.find(params[:id])
  end

end

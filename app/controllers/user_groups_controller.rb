class UserGroupsController < ApplicationController
  def new 
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.new
    @user_group.group_id = @group.id
    @user_group.user_id = current_user.id
    @user_group.save 

    respond_to do |format|
      format.html{redirect_to groups_path, notice: "new group"}
      format.js 
    end 
  end

  def destroy
    @user = User.find(params[:user_id])
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy

    respond_to do |format|
      format.html{redirect_to concerts_path, notice: "destroy"}
      format.js
    end
  end
end

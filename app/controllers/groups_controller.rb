class GroupsController < ApplicationController
  def index
    @groups = Group.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end 

  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        usergroup = UserGroup.new
        usergroup.user_id = current_user.id
        usergroup.group_id = @group.id
        usergroup.group_leader = true
        usergroup.save
        format.html { redirect_to @group, notice: 'Post of Group was successfully created.' }
        format.json { render json: @group, group: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, group: :unprocessable_entity }
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, group: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.user_groups.destroy_all
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end

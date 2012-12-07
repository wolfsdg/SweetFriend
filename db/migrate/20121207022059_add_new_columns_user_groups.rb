class AddNewColumnsUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :group_leader, :boolean, default: false
    add_column :user_groups, :friend_id, :integer
  end
end

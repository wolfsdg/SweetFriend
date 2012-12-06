class ChangeColumnToUserGroup < ActiveRecord::Migration
  def change
    remove_column :user_groups, :group_id
    remove_column :user_groups, :user_id
    add_column :user_groups, :group_id, :integer
    add_column :user_groups, :user_id, :integer
  end
end

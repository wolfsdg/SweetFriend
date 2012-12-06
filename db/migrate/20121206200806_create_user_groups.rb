class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :group_id
      t.string :user_id
      t.timestamps
    end
  end
end

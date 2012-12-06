class Group < ActiveRecord::Base
  attr_accessible :group_name
  has_many :user_groups
  has_many :users, :through => :user_groups
end

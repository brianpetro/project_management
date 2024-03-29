class Group < ActiveRecord::Base
  attr_accessible :name, :members_attributes
	has_many :members
	has_many :users, :through => :members, uniq: true
  accepts_nested_attributes_for :members
end

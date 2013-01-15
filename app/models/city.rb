class City < ActiveRecord::Base
  attr_accessible :name, :state
	has_many :reviewers
	has_many :users, :through => :reviewers
  has_many :seals
	has_many :projects, :through => :seals
end

class City < ActiveRecord::Base
  attr_accessible :name
	has_many :reviewers
	has_many :users, :through => :reviewers
end

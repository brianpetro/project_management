class Task < ActiveRecord::Base
  attr_accessible :complete, :name
	belongs_to :project
end
class Task < ActiveRecord::Base
  attr_accessible :complete, :name, :user_id, :project_id
	belongs_to :project
end

class Blueprint < ActiveRecord::Base
  attr_accessible :id, :loc, :project_id
  belongs_to :project
end

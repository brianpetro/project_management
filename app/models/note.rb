class Note < ActiveRecord::Base
  attr_accessible :id, :note, :project_id
  belongs_to :project
end

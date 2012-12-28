class Seal < ActiveRecord::Base
  attr_accessible :city_id, :project_id
	belongs_to :project
	belongs_to :city
end

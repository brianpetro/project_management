class Reviewer < ActiveRecord::Base
  attr_accessible :city_id, :user_id
	belongs_to :city
	belongs_to :user
end

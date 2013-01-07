class Participant < ActiveRecord::Base
  attr_accessible :project_id, :user_id
  belongs_to :project
  belongs_to :user

	def user_id
		user.try(:name)
	end

	def user_id=(name)
		self.user = User.find_by_name(name) if name.present?
	end
end

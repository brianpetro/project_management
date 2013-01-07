class Member < ActiveRecord::Base
  attr_accessible :group_id, :user_id
	belongs_to :group
	belongs_to :user


	def user_id
		user.try(:name)
	end

	def user_id=(name)
		self.user = User.find_by_name(name) if name.present?
	end
end

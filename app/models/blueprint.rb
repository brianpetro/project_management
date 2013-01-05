class Blueprint < ActiveRecord::Base
  attr_accessible :id, :project_id, :bpu, :title, :tag_list
  belongs_to :project
  has_many :coordinates
  has_many :notes, :through => :coordinates
	mount_uploader :bpu, BpuUploader

	acts_as_taggable
end

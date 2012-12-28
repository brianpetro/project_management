class Blueprint < ActiveRecord::Base
  attr_accessible :id, :loc, :project_id, :bpu
  belongs_to :project
  has_many :coordinates
  has_many :notes, :through => :coordinates
	mount_uploader :bpu, BpuUploader
end

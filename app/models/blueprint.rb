class Blueprint < ActiveRecord::Base
  attr_accessible :id, :loc, :project_id
  belongs_to :project
  has_many :coordinates
  has_many :notes, :through => :coordinates
end

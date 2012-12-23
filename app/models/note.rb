class Note < ActiveRecord::Base
  attr_accessible :id, :note, :project_id, :coordinates_attributes
  belongs_to :project
  has_many :coordinates, :dependent => :destroy
  accepts_nested_attributes_for :coordinates
end

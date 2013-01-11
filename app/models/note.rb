class Note < ActiveRecord::Base
  attr_accessible :id, :note, :project_id, :coordinates_attributes, :note_text, :tag_list, :user_id
  
	belongs_to :project # Nested under projects
  has_many :coordinates, :dependent => :destroy # Blueprint associations handled by coordinates
  accepts_nested_attributes_for :coordinates

	acts_as_taggable
	
end

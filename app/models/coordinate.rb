class Coordinate < ActiveRecord::Base
  attr_accessible :blueprint_id, :note_id
  belongs_to :note
  belongs_to :blueprint
end

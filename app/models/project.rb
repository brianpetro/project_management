class Project < ActiveRecord::Base
  attr_accessible :id, :name, :participants_attributes, :sealed, :blueprints_attributes
  
	# Products of a project
  has_many :blueprints
  has_many :notes
	has_many :participants, :dependent => :destroy
  has_many :users, :through => :participants, :uniq => true
  accepts_nested_attributes_for :participants
  accepts_nested_attributes_for :blueprints
  accepts_nested_attributes_for :notes

	# For Sign Seal Submit to cities
	has_one :seal, :dependent => :destroy
	has_one :city, :through => :seal
	
	# For Todo Lists
	has_many :tasks

end

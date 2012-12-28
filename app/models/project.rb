class Project < ActiveRecord::Base
  attr_accessible :id, :name, :participants_attributes
  has_many :participants
  has_many :users, :through => :participants, :uniq => true
  has_many :blueprints
  has_many :notes
  accepts_nested_attributes_for :participants
	has_one :seal, :dependent => :destroy
	has_one :city, :through => :seal
	

end

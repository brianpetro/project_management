class Project < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :participants
  has_many :users, :through => :participants
  has_many :blueprints
  has_many :notes
end
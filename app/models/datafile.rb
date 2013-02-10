class Datafile < ActiveRecord::Base
  belongs_to :project
  has_many :characters

  attr_accessible :name, :status
end

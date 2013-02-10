class Project < ActiveRecord::Base
  has_many :datafiles

  attr_accessible :archive, :name
end

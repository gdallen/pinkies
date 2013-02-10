class Character < ActiveRecord::Base
  belongs_to :datafile
  attr_accessible :count, :letter
end

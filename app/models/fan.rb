class Fan < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
end

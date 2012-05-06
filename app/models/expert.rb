class Expert < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email_address, :expertise, :professional_bio, :topics_of_interest
  has_many :posts

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :email_address, :presence => true
  validates :email_address, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :email_address, :uniqueness => true
  
  validates :expertise, :presence => true
  validates :professional_bio, :length => { :maximum => 500, :too_long => "%{count} characters is the maximum allowed" }
end

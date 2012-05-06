class Expert < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email_address, :expertise, :professional_bio, :topics_of_interest, :password, :password_confirmation
  before_save { |experts| experts.email_address = email_address.downcase }
  before_save :create_remember_token
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :first_name, :presence => true, length: { maximum: 50 }
  validates :last_name, :presence => true, length: { maximum: 50 }

  validates :email_address, :presence => true, length: { maximum: 50 }, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }, uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  validates :expertise, :presence => true
  validates :professional_bio, :length => { :maximum => 500, :too_long => "%{count} characters is the maximum allowed" }

def feed
  posts
end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

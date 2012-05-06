class Post < ActiveRecord::Base
	attr_accessible :title, :content, :expert_id
	belongs_to :user

	validates :title, :presence => true
	validates :content, :length => { :maximum => 500, :too_long => "%{count} characters is the maximum allowed" }
end

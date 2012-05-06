class Post < ActiveRecord::Base
	attr_accessible  :content, :expert_id
	belongs_to :expert

	validates :expert_id, presence: true
	validates :content, :length => { :maximum => 500, :too_long => "%{count} characters is the maximum allowed" }

	default_scope order: 'posts.created_at DESC'


end

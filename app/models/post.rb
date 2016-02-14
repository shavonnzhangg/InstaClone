class Post < ActiveRecord::Base
	validates :image, presence: true

	has_attached_file :image, styles: {medium: "640px"}		#include Paperclip functionality
	validates_attachment :image,
		content_type: {content_type: ["image/jpeg" , "image/gif" , "image/png"]}
	end
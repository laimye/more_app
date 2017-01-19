class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip
	has_many :comments, dependent: :destroy
	has_many :likes
	has_many :liking_users, through: :likes, source: :user

	accepts_nested_attributes_for :comments

	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
end

class User < ActiveRecord::Base
	has_many :trips
	has_many :invites

	has_many :invited_trips, through: :invites, source: :trip

	has_many :posts, dependent: :destroy

	has_many :comments, dependent: :destroy

	has_many :announcements, dependent: :destroy

	has_secure_password

	validates :email, presence: true, uniqueness: true

	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
end

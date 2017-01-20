class Trip < ActiveRecord::Base
	belongs_to :user
	has_many :invites
	has_many :invited_users, through: :invites, source: :user
	has_many :posts, dependent: :destroy
	has_many :announcements, dependent: :destroy

	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
end

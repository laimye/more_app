class Trip < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	# has_many :announcements, dependent: :destroy
	has_and_belongs_to_many :users

	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
end

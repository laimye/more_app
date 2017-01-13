class Trip < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	# has_many :announcements, dependent: :destroy
	has_and_belongs_to_many :users
end

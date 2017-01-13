class User < ActiveRecord::Base
	has_and_belongs_to_many :trips

	has_many :posts, dependent: :destroy

	has_many :comments, dependent: :destroy

	has_secure_password

	validates :email, presence: true, uniqueness: true
end

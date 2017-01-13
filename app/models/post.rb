class Post < ActiveRecord::Base
	belongs_to :user

	belongs_to :trip

	has_many :comments, dependent: :destroy

	accepts_nested_attributes_for :comments
	
end

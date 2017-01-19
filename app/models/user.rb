class User < ActiveRecord::Base
	has_many :trips
	has_many :invites
	has_many :invited_trips, through: :invites, source: :trip
	has_many :posts, dependent: :destroy
	has_many :likes
	has_many :liked_posts, through: :likes, source: :post
	has_many :announcements, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_secure_password

	validates :email, presence: true, uniqueness: true
	has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
  # creates a new like row with post_id and user_id
  def like!(post_id)
    self.likes.create(post_id: post_id)
  end

  # destroys a like with matching post_id and user_id
  def unlike!(post_id)
    like = self.likes.find_by(post_id: post_id)
    like.destroy
  end

  # returns true of false if a post is liked by user
  def like?(post_id)
    self.likes.find_by(post_id: post_id)
  end

end

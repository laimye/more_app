class AddUserRefTripRefToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true, foreign_key: true
    add_reference :posts, :trip, index: true, foreign_key: true
  end
end

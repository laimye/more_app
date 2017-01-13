class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :place
      t.date :startdate
      t.date :enddate
      t.string :about

      t.timestamps null: false
    end
  end
end

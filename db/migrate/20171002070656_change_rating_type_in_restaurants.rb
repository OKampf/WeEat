class ChangeRatingTypeInRestaurants < ActiveRecord::Migration[5.1]
  def self.up
    change_column :restaurants, :rating, :decimal, precision: 8, scale: 2
  end

  def self.down
    change_column :restaurants, :rating, :integer
  end
end

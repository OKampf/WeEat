class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :rating
      t.boolean :accept_10bis
      t.string :address
      t.integer :max_delivery_time
      t.references :cuisine

      t.timestamps
    end
  end
end

class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :chain
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :city
      t.integer :zip
      t.integer :phone
      t.string :country_code

      t.timestamps
    end
  end
end

class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :chain
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone
      t.string :country_code

      t.timestamps
    end
  end
end

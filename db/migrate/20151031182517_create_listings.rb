class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :uuid
      t.boolean :active
      t.string :name
      t.string :email
      t.string :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :lat
      t.string :lng
      t.string :phone_number

      t.timestamps null: false
    end
  end
end

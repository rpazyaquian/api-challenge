class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :interest_point_id
      t.string :name

      t.timestamps null: false
    end
  end
end

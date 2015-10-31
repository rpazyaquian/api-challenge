class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :photo, index: true, foreign_key: true
    end
  end
end

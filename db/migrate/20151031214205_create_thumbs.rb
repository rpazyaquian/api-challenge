class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.string :url
      t.belongs_to :image, index: true, foreign_key: true
    end
  end
end

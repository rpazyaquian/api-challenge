class CreateTagAssociations < ActiveRecord::Migration
  def change
    create_table :tag_associations do |t|
      t.belongs_to :listing, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true
    end
  end
end

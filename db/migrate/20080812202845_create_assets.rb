class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :size
      t.string  :content_type
      t.string  :filename
      t.integer :height
      t.integer :width
      t.integer :parent_id
      t.string  :thumbnail
      t.integer :db_file_id
      t.integer :assetable_id
      t.string  :assetable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end

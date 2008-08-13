class CreatePlacements < ActiveRecord::Migration
  def self.up
    create_table :placements do |t|
      t.integer :product_id
      t.integer :category_id
      t.integer :position, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :placements
  end
end

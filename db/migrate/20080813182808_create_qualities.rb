class CreateQualities < ActiveRecord::Migration
  def self.up
    create_table :qualities do |t|
      t.integer :product_id
      t.integer :customization_id
      t.integer :position, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :qualities
  end
end

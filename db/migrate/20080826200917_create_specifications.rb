class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.integer :product_id
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end

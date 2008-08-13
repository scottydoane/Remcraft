class CreateCustomizations < ActiveRecord::Migration
  def self.up
    create_table :customizations do |t|
      t.string :name
      t.integer :option_id
      t.integer :position, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :customizations
  end
end

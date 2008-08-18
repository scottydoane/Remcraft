class AddPublishedToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :published, :boolean
  end

  def self.down
    remove_column :products, :published
  end
end

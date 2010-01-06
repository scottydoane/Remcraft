class AddUrlToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :url, :string
  end

  def self.down
    remove_column :categories, :url
  end
end

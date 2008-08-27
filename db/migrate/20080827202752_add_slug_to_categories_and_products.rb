class AddSlugToCategoriesAndProducts < ActiveRecord::Migration
  def self.up
    add_column :categories, :slug, :string
    add_column :products, :slug, :string
  end

  def self.down
    remove_column :categories, :slug
    remove_column :products, :slug
  end
end

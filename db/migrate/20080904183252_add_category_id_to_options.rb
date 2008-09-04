class AddCategoryIdToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :category_id, :integer
  end

  def self.down
    remove_column :options, :category_id
  end
end

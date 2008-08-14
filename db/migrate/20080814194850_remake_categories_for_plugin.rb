class RemakeCategoriesForPlugin < ActiveRecord::Migration
  def self.up
    drop_table :categories
    create_table :categories do |t|
      t.string :name
      t.column :parent_id,         :integer
      t.column :position,          :integer
      t.column :children_count,    :integer
      t.column :ancestors_count,   :integer
      t.column :descendants_count, :integer
      
      t.timestamps
    end

  end

  def self.down
    drop_table :categories
  end
end

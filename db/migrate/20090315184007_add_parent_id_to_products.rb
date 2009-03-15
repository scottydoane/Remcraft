class AddParentIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :parent_id, :integer
    add_column :products, :type, :string
    Product.find(:all).each do |product|
      product.update_attribute('type', 'Product')
    end
  end

  def self.down
    remove_column :products, :type
    remove_column :products, :parent_id
  end
end

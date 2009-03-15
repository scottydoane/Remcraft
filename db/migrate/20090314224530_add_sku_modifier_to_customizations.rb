class AddSkuModifierToCustomizations < ActiveRecord::Migration
  def self.up
    add_column :customizations, :skumod, :string
  end

  def self.down
    remove_column :customizations, :skumod
  end
end

class AddPriceModifierToCustomizations < ActiveRecord::Migration
  def self.up
    add_column :customizations, :modifier, :integer
    remove_column :options, :modifier
  end

  def self.down
    remove_column :customizations, :modifier
    add_column :options, :modifier, :integer
  end
end

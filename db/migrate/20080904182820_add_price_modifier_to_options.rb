class AddPriceModifierToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :modifier, :integer
  end

  def self.down
    remove_column :options, :modifier
  end
end

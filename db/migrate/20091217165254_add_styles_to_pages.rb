class AddStylesToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :style, :text
  end

  def self.down
    remove_column :pages, :style
  end
end

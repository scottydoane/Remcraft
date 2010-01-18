class AddShowHeaderToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :show_header, :boolean
  end

  def self.down
    remove_column :pages, :show_header
  end
end

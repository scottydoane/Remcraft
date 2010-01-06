class AddIsFinishToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :is_finish, :boolean
  end

  def self.down
    remove_column :options, :is_finish
  end
end

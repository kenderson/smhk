class AddingNamesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :formal_name, :string
  end

  def self.down
    remove_column :users, :formal_name
  end
end

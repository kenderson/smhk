class AddingNamesToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :name, :string
  end

  def self.down
    add_column :comments, :name
  end
end

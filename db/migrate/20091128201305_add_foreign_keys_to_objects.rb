class AddForeignKeysToObjects < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
  end

  def self.down
    add_column :posts, :user_id
  end
end

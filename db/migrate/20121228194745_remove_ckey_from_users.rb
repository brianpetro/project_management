class RemoveCkeyFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :ckey
  end

  def down
    add_column :users, :ckey, :string
  end
end

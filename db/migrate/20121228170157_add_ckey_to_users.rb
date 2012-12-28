class AddCkeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ckey, :string
  end
end

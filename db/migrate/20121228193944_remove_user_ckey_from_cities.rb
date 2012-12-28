class RemoveUserCkeyFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :user_ckey
  end

  def down
    add_column :cities, :user_ckey, :string
  end
end

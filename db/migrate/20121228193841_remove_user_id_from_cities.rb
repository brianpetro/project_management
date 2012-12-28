class RemoveUserIdFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :user_id
  end

  def down
    add_column :cities, :user_id, :integer
  end
end

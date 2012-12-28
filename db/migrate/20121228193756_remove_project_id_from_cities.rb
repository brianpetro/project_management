class RemoveProjectIdFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :project_id
  end

  def down
    add_column :cities, :project_id, :integer
  end
end

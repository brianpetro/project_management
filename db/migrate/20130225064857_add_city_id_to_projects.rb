class AddCityIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :city_id, :integer
  end
end

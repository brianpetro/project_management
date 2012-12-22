class AddProjectIdToBlueprints < ActiveRecord::Migration
  def change
    add_column :blueprints, :project_id, :integer
  end
end

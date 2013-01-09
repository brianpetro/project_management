class AddPositionToBlueprints < ActiveRecord::Migration
  def change
    add_column :blueprints, :position, :integer
  end
end

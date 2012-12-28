class AddBpuToBlueprints < ActiveRecord::Migration
  def change
    add_column :blueprints, :bpu, :string
  end
end

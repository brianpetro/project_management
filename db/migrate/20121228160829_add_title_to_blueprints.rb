class AddTitleToBlueprints < ActiveRecord::Migration
  def change
    add_column :blueprints, :title, :string
  end
end

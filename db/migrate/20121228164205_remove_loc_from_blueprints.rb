class RemoveLocFromBlueprints < ActiveRecord::Migration
  def up
    remove_column :blueprints, :loc
  end

  def down
    add_column :blueprints, :loc, :string
  end
end

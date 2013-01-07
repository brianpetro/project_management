class AddAuthorToBlueprint < ActiveRecord::Migration
  def change
    add_column :blueprints, :author, :string
  end
end

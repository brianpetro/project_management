class CreateBlueprints < ActiveRecord::Migration
  def change
    create_table :blueprints do |t|
      t.integer :id
      t.string :loc

      t.timestamps
    end
  end
end

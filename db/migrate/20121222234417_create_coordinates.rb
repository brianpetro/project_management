class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.integer :note_id
      t.integer :blueprint_id

      t.timestamps
    end
  end
end

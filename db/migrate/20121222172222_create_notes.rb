class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :id
      t.string :note

      t.timestamps
    end
  end
end

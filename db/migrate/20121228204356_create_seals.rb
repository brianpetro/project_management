class CreateSeals < ActiveRecord::Migration
  def change
    create_table :seals do |t|
      t.integer :project_id
      t.integer :city_id

      t.timestamps
    end
  end
end

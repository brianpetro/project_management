class AddSealedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :sealed, :boolean
  end
end

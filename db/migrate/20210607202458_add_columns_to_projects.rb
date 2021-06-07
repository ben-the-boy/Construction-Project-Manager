class AddColumnsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :user_id, :integer
    add_column :projects, :subcontractor_id, :integer
  end
end

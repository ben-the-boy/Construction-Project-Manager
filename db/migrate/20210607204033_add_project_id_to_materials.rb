class AddProjectIdToMaterials < ActiveRecord::Migration[6.1]
  def change
    add_column :materials, :project_id, :integer
  end
end

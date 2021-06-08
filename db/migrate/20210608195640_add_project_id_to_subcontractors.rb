class AddProjectIdToSubcontractors < ActiveRecord::Migration[6.1]
  def change
    add_column :subcontractors, :project_id, :integer
  end
end

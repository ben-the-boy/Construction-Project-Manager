class FixProjectsColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :subcontractor_id, :client_id
  end
end

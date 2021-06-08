class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :type, :category
  end
end

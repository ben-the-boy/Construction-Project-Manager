class RenameClientBudgetColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :clients, :budget, :email
    change_column :clients, :email, :string
  end
end

class CreateSubcontractors < ActiveRecord::Migration[6.1]
  def change
    create_table :subcontractors do |t|
      t.string :name
      t.string :specialty

      t.timestamps
    end
  end
end

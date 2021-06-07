class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :type
      t.integer :length

      t.timestamps
    end
  end
end

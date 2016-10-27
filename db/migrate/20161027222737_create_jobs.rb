class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end

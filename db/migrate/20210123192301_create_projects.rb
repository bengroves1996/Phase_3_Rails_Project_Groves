class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :priority
      t.string :description
      t.string :title
      t.integer :user_id ##Foreign Key!
      t.timestamps
    end
  end
end

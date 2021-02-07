class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :objective
      t.boolean :complete
      t.timestamps
      t.integer :project_id ##Foreign Key for Projects
      t.integer :user_id ##Foreign Key for Users
    end
  end
end

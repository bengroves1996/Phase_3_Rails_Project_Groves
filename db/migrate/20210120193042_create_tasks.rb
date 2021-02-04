class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :objective
      t.boolean :complete
      t.timestamps
      t.integer :project_id ##Foreign Key!
      t.belongs_to :user
    end
  end
end

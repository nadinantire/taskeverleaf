class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :content
      t.string :status
      t.integer :priority
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end

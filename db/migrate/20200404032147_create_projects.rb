class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :department
      t.string :name
      t.text :desc
      t.integer :client_id
      t.string :user_id
      t.string :integer
      t.integer :target_completion_date

      t.timestamps
    end
  end
end

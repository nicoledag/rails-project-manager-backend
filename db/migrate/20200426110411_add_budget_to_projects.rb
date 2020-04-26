class AddBudgetToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :budget, :integer
  end
end

class AddCompletionDateToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :completion_date, :date
  end
end

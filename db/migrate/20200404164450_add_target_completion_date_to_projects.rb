class AddTargetCompletionDateToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :target_completion_date, :date
  end
end

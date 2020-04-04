class RemoveTargetCompletionDateFromProjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :projects, :target_completion_date, :integer
  end
end

class RemoveIntegerFromProjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :projects, :integer, :string
  end
end

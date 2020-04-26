class AddEndDestinationToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :end_destination, :string
  end
end

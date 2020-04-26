class AddQuantityToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :quantity, :integer
  end
end

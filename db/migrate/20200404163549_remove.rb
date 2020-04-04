class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :user_id, :string
  end
end

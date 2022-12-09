class AddIsDeletedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_deleted, :string
    add_column :users, :boolean, :string
  end
end

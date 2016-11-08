class AddUsertypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :type, :string, null: false
    add_column :users, :comment, :text
  end
end

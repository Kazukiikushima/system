class ChangeDatatypeIsbnOfItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :isbn, :bigint
  end
end

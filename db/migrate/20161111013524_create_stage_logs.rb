class CreateStageLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :stage_logs do |t|
      t.string :active
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.date :date
      t.integer :number

      t.timestamps
    end
  end
end

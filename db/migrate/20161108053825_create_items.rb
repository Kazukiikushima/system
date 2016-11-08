class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :large_image
      t.string :url
      t.string :publisher
      t.date :publish_date
      t.integer :price
      t.string :genre
      t.integer :number
      t.string :author
      t.string :air_regi
      t.integer :isbn
      t.string :stage
      t.date :arrival_day
      t.integer :return_period

      t.timestamps
    end
  end
end

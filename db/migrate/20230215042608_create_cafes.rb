class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :title
      t.text :description
      t.decimal :longitude
      t.decimal :latitude
      t.numeric :rating

      t.timestamps
    end
  end
end

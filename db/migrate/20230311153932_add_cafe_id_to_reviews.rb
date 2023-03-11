class AddCafeIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :cafe_id, :integer
  end
end

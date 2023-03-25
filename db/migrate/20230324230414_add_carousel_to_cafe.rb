class AddCarouselToCafe < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :carousel, :boolean, :default => false
  end
end

class AddAddressToCafe < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :address, :string
  end
end

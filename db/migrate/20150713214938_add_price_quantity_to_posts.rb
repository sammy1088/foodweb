class AddPriceQuantityToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :price, :string
    add_column :posts, :quantity, :string
  end
end

class AddCategToUsers < ActiveRecord::Migration
  def change
    add_column :users, :categ, :string
  end
end

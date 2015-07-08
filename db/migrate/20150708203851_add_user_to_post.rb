class AddUserToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :username, :string
  end
end

class AddEmailAddressToPost < ActiveRecord::Migration
  def change
    add_column :posts, :email_address, :string
  end
end

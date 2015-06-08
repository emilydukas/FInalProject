class AddPhoneNumberToPost < ActiveRecord::Migration
  def change
    add_column :posts, :phone_number, :text
  end
end

class ChangePhoneType < ActiveRecord::Migration[5.0]
  def change
    change_column :businesses, :phone, :string
  end
end

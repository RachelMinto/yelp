class ChangeZipcode < ActiveRecord::Migration[5.0]
  def change
    change_column :businesses, :zipcode, :string
  end
end

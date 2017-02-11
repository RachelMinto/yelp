class ConvertZipcodeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :business, :zipcode, :string
  end
end

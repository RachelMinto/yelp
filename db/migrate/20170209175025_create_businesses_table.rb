class CreateBusinessesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :phone
      t.boolean :bike_parking
      t.boolean :credit_cards
      t.boolean :wheel_chair
      t.string :mon_start
      t.string :mon_end
      t.string :tue_start
      t.string :tue_end
      t.string :wed_start
      t.string :wed_end
      t.string :thu_start
      t.string :thu_end
      t.string :fri_start
      t.string :fri_end
      t.string :sat_start
      t.string :sat_end
      t.string :sun_start
      t.string :sun_end                                   
      t.timestamps
    end
  end
end

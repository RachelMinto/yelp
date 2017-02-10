class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.string :comment
      t.integer :user_id
      t.integer :business_id
      t.timestamps
    end
  end
end

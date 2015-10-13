class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :thoughts
      t.integer :rating, limit: 5

      t.timestamps null: false
    end
  end
end

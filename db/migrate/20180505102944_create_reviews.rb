class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.string :retaurant
      t.string :string
      t.integer :price
      t.string :cuisine

      t.timestamps
    end
  end
end

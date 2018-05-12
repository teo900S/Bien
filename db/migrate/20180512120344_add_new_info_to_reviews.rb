class AddNewInfoToReviews < ActiveRecord::Migration[5.1]
  def change

    add_column :reviews, :phone_number, :string
    add_column :reviews, :anbiance, :string
    rename_column :reviews, :retaurant, :restaurant
  end
end

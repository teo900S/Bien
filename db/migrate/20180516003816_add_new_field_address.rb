class AddNewFieldAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :address, :text_field
  end
end

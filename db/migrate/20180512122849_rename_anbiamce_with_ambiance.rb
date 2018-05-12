class RenameAnbiamceWithAmbiance < ActiveRecord::Migration[5.1]

  def change
    rename_column :reviews, :anbiance, :ambiance
  end

end

class AddNameColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :name, :string, null:false 
  end
  
end

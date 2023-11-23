class ToursDeleteDate < ActiveRecord::Migration[7.1]
  def change
    remove_column :tours , :date , :date 
  end
end

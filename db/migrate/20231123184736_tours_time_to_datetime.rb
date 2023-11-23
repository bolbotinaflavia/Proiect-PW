class ToursTimeToDatetime < ActiveRecord::Migration[7.1]
  def change
    change_column :tours , :data_ora , :datetime
  end
end

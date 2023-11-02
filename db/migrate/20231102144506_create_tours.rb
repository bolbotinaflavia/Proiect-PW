class CreateTours < ActiveRecord::Migration[7.1]
  def change
    create_table :tours do |t|
      t.belongs_to :eveniment
      t.datetime :data_ora
      t.text :detalii
      t.timestamps
    end
  end
end

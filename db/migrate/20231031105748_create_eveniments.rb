class CreateEveniments < ActiveRecord::Migration[7.1]
  def change
    create_table :eveniments do |t|
      t.string :titlu
      t.text :descriere
      t.datetime :timp_start
      t.datetime :timp_final

      t.timestamps
    end
  end
end

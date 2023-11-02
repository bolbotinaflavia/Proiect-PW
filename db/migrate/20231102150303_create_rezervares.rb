class CreateRezervares < ActiveRecord::Migration[7.1]
  def change
    create_table :rezervares do |t|
      t.belongs_to :tours
      t.text :nume
      t.text :prenume
      t.text :email
      t.text :telefon

      t.timestamps
    end
  end
end

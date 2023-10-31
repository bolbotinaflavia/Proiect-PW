class ModificareDenumiriTabel < ActiveRecord::Migration[7.1]
  def change
   rename_column:eveniments, :timp_start, :start_time
   rename_column:eveniments,:timp_final,:end_time
  end
end

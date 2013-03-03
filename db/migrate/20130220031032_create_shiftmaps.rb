class CreateShiftmaps < ActiveRecord::Migration
  def change
    create_table :shiftmaps do |t|
      t.string :letter
      t.string :keystroke

      t.timestamps
    end
  end
end

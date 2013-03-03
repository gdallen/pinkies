class CreateCharmaps < ActiveRecord::Migration
  def change
    create_table :charmaps do |t|
      t.string :letter
      t.string :keystroke

      t.timestamps
    end
  end
end

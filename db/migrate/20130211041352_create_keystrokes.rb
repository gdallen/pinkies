class CreateKeystrokes < ActiveRecord::Migration
  def change
    create_table :keystrokes do |t|
      t.string :keystroke
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end

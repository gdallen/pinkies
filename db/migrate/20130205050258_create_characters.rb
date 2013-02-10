class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :letter
      t.integer :count
      t.references :datafile

      t.timestamps
    end
    add_index :characters, :datafile_id
  end
end

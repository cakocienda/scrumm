class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :num
      t.integer :work
      t.string :epstring
      t.integer :epint
      t.string :ep2string
      t.integer :ep2int

      t.timestamps
    end
  end
end

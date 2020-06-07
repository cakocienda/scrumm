class CreateSolution2s < ActiveRecord::Migration[6.0]
  def change
    create_table :solution2s do |t|
      t.integer :num
      t.string :epstring
      t.integer :epint
      t.string :ep2string
      t.integer :ep2int

      t.timestamps
    end
  end
end

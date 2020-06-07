class CreateProblem2s < ActiveRecord::Migration[6.0]
  def change
    create_table :problem2s do |t|
      t.integer :num
      t.string :epstring
      t.string :epint
      t.string :integer

      t.timestamps
    end
  end
end

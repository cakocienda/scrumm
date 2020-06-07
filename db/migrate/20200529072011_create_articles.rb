class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :num
      t.integer :work

      t.timestamps
    end
  end
end

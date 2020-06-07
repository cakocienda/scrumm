class CreateCommentts < ActiveRecord::Migration[6.0]
  def change
    create_table :commentts do |t|
      t.integer :commenter
      t.integer :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end

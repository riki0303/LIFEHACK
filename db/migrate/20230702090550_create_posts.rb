class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true

      t.text :ttle, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end

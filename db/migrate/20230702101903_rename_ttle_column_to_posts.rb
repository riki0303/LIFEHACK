class RenameTtleColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :ttle, :title
  end
end

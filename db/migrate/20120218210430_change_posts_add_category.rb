class ChangePostsAddCategory < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.references :category
    end
  end

  def down
    change_table :posts do |t|
      remove_column :category
    end
  end
end

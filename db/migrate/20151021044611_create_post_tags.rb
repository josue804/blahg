class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.column :post_id, :integer
      t.column :tag_id, :integer

      t.timestamps
    end
  end
end

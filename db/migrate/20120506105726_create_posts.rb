class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :expert_id

      t.timestamps
    end
	add_index :posts, [:expert_id, :created_at]
  end
end

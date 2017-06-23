class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :type
      t.integer :price
      t.integer :tclick
      t.string :location
      t.text :content
      t.boolean :is_sold

      t.timestamps
    end
  end
end

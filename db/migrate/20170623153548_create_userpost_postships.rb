class CreateUserpostPostships < ActiveRecord::Migration[5.1]
  def change
    create_table :userpost_postships do |t|
      t.integer :userpost_id
      t.integer :post_id

      t.timestamps
    end
  end
end

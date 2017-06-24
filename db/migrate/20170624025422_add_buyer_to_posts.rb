class AddBuyerToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :buyer_id, :integer
  end
end

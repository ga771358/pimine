class AddOrderToUserpost < ActiveRecord::Migration[5.1]
  def change
    add_column :userposts, :order,:integer
  end
end

class ChangePostTypeName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :posts, :type , :itype
  end
end

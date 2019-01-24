class AddPicturenameToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :picturename, :string
  end
end

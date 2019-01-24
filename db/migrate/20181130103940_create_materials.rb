class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :mate_name
      t.integer :top_id
      t.integer :mainpart_id
      t.timestamps
    end
  end
end

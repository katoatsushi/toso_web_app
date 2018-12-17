class CreateReforms < ActiveRecord::Migration[5.1]
  def change
    create_table :reforms do |t|
      #部位
      t.string :reform_part
      #各部位の素材
      t.string :reform_material
      #仕上げ素材
      t.string :reform_working_out
      
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSymptoms < ActiveRecord::Migration[5.1]
  def change
    create_table :symptoms do |t|
      t.string :s_name
      # t.text :condition
      # t.text :treatment

      #階層に伴うid取得
      t.integer :top_id
      t.integer :material_id
      t.integer :mainpart_id
      t.timestamps
    end
  end
end

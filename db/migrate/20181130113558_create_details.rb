class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :detail_name
      t.text :condition
      t.text :treatment
      t.string :detail_type
      #階層に伴うid取得
      t.integer :material_id
      t.integer :mainpart_id
      t.integer :symptom_id
      t.timestamps
    end
  end
end

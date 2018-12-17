class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.text :cond
      t.text :treat
      #グラフ点数表示のためのカラム
      t.integer :score
      t.string :part_type
      #ここまで
      #t.references :user, foreign_key: true
      t.references :building, foreign_key: true
      t.integer :detail_id

      t.timestamps
    end
  end
end

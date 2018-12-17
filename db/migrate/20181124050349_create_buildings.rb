class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
    	t.string :building_name
    	t.string :building_place
        t.string :building_year
        t.string :building_scale
        #以下タグボタンにするかも
        t.string :building_type
        t.string :building_construction
        #ここまで
        t.integer :user_id
      t.timestamps
    end
  end
end

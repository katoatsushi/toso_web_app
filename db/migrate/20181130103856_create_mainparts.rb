class CreateMainparts < ActiveRecord::Migration[5.1]
  def change
    create_table :mainparts do |t|
      t.string :mp_name
      t.integer :top_id
      #t.integer :part_id
      t.timestamps
    end
  end
end

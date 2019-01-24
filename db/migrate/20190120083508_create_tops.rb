class CreateTops < ActiveRecord::Migration[5.1]
  def change
    create_table :tops do |t|
      t.string :maintitle

      t.timestamps
    end
  end
end

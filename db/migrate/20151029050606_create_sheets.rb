class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      
      t.string :name
      t.string :background_color
      t.string :tab_color
      t.string :tab_width
      t.string :tab_height

      t.timestamps null: false
    end
    add_index :sheets, [:user_id, :created_at]
  end
end

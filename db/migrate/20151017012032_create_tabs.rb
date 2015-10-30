class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.text :address
      t.text :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tabs, [:sheet_id, :created_at]
  end
end

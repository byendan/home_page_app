class AddPictureToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :picture, :string
  end
end

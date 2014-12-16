class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |col|
      col.string :title
      col.text :content
      col.timestamps
    end
  end
end

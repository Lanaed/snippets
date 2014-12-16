class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |col|
      col.string :name
      col.text :body
      col.timestamps
    end
  end
end

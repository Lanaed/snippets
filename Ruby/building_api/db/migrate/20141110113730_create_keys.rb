class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :key
      t.integer :count, :default => 0
    end
  end
end

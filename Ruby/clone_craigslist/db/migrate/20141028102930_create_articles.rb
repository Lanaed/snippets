class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :title
      t.integer :price
      t.string :description
      t.string :key
      t.integer :category_id

      t.timestamps
    end
  end
end

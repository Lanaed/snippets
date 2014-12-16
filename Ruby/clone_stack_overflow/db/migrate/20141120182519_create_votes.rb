class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic: true
      t.integer :direction

      t.timestamps
    end
  end
end

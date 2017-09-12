class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string 	 :name
      t.string 	 :description
      t.string 	 :location
      t.integer  :total_wins
      t.integer  :total_losses

      t.timestamps
    end
  end
end

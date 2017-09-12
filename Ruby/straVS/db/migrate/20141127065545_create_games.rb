class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string   :name
      t.string   :description
      t.integer  :team_id
      t.integer  :awayteam_id

      t.timestamps
    end
  end
end

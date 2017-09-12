class CreateTeamChats < ActiveRecord::Migration

	def change
    	create_table :team_chats do |t|
	      t.string 	 :content
	      t.integer  :user_id

	      t.timestamps
	    end
	end

end

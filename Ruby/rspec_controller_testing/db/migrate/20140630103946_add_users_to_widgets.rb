class AddUsersToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :user_id, :integer
  end
end

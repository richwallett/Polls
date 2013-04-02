class AddIndexToTables < ActiveRecord::Migration
  def change
    #Table name, Foreign key
    add_index :polls, :creator_id
    add_index :questions, :poll_id
    add_index :answer_logs, :user_id
  end
end

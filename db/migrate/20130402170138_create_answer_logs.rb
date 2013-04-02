class CreateAnswerLogs < ActiveRecord::Migration
  def change
    create_table :answer_logs do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :response_id
      t.timestamps
    end
  end
end

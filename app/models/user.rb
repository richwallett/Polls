class User < ActiveRecord::Base
  attr_accessible :username, :email
  has_many :polls, :foreign_key => "creator_id"
  has_many :answer_logs

  def create_poll(poll_name)
    polls.create(:name => poll_name)
  end

  def polls_taken
    AnswerLog.where(:user_id => self.id)
  end

  def submit_answer(question_id, response_id)
    answerlogs.create(
      :response_id => response_id,
      :question_id => question_id
    )
  end


end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


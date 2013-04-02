class AnswerLog < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :response_id
  belongs_to :question
  belongs_to :user
end

# == Schema Information
#
# Table name: answer_logs
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  response_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class AnswerLog < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :response_id
  belongs_to :question
  belongs_to :user
  validates :user_id, :question_id, :response_id, :presence => true
  validates :user_id, :uniqueness => { :scope => :question_id }

end

=begin
belongs_to :question
SELECT *
  FROM questions
 WHERE questions.id = "#{answer_logs.question_id}"

belongs_to :user
SELECT *
  FROM users
 WHERE users.id = "#{answer_logs.user_id}"
=end

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


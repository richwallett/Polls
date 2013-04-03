class Question < ActiveRecord::Base
  attr_accessible :poll_id, :question
  belongs_to :poll
  has_many :responses, :dependent => :destroy
  has_many :answer_logs, :dependent => :destroy
  validates :poll_id, :question, :presence => true

  def create_responses(answers)
    answers.each do |answer|
      responses.create(:answer => answer)
    end
  end
end

=begin
belongs_to :poll
SELECT *
  FROM polls
 WHERE polls.id = "#{answer_logs.poll_id}"

has_many :responses
SELECT *
  FROM responses
 WHERE responses.creator_id = "#{user.id}"

has_many :answer_log
SELECT *
  FROM answer_log
 WHERE answer_log.creator_id = "#{user.id}"
=end

# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer
#  question   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


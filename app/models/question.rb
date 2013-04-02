class Question < ActiveRecord::Base
  attr_accessible :poll_id, :question
  belongs_to :poll
  has_many :responses
  has_many :answer_logs

  def create_responses(*answers)
    answers.each do |answer|
      responses.create(:answer => answer)
    end
  end

end

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


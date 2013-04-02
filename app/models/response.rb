class Response < ActiveRecord::Base
  attr_accessible :answer, :question_id, :poll_id
  belongs_to :question
end

# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  question_id :integer
#  answer      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class Poll < ActiveRecord::Base
  attr_accessible :creator_id, :name
  belongs_to :user
  has_many :questions

  def create_question(question)
    questions.create(:question => question)
  end

end

# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  creator_id :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


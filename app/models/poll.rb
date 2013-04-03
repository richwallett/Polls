class Poll < ActiveRecord::Base
  attr_accessible :creator_id, :name, :team_id
  belongs_to :user, :foreign_key => :creator_id
  has_many :questions, :dependent => :destroy
  validates :name, :creator_id, :presence => true

  def self.print_polls(user)
    polls = user.untaken_polls.map do |poll|
      [poll.id, poll.name]
    end
    polls.each {|poll| puts "#{poll[0]}. #{poll[1]}"}
  end


  def create_question(question)
    questions.create(:question => question)
  end

end

=begin
belongs_to :user
SELECT *
  FROM users
 WHERE users.id = "#{answer_logs.user_id}"

has_many :questions
SELECT *
  FROM questions
 WHERE questions.creator_id = "#{user.id}"
=end

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


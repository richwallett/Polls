class User < ActiveRecord::Base
  attr_accessible :username, :email, :team_id
  has_many :polls, :foreign_key => "creator_id", :dependent => :destroy
  has_many :answer_logs, :dependent => :destroy
  validates :username, :email, :presence => true
  validates :username, :email, :uniqueness => true

  def self.login(name)
    if User.find_by_username(name).nil?
      puts "Please enter your email:"
      email = gets.chomp
      User.create!(:username => name, :email => email)
    end
    User.find_by_username(name)
  end

  def create_poll(poll_name, team_id = nil)
    polls.create!(:name => poll_name, :team_id => team_id)
  end

  def taken_polls
    AnswerLog.where(:user_id => self.id)
  end

  def submit_answer(question_id, response_id)
    answer_logs.create!(
      :response_id => response_id,
      :question_id => question_id
    )
  end

  def untaken_polls
    questions = Question.joins(:answer_logs).where("user_id != ?", self.id)
    questions.map do |question|
      question.poll if question.poll.team_id == self.team_id ||
                       question.poll.team_id == nil
    end.uniq.delete_if { |item| item.is_a?(Question) }
  end
  # This needs to be changed to SQL - Left Outer Join
  # Also, the last line is insane - Ned

end

=begin
has_many :polls
SELECT *
  FROM polls
 WHERE polls.creator_id = "#{users.id}"

has_many :answer_logs
SELECT *
  FROM answer_logs
 WHERE answer_logs.user_id = "#{users.id}"
=end

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


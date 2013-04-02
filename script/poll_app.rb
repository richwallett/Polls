puts "Please enter your username:"
username = gets.chomp
puts "Please enter your email:"
email = gets.chomp
@logged_user = User.login(username, email)
input = nil


def take_questions(poll)
  questions = poll.questions
  responses = questions.map { |q| q.responses }
  questions.length.times do |i|
    puts "#{questions[i].question}"
    responses[i].each {|response| puts "#{response.id}. #{response.answer}"}
    choice = gets.chomp.to_i
    @logged_user.submit_answer(questions[i].id, responses[i][choice])
    puts
  end
  puts "Thank you for taking the poll."
end

def take_poll
  puts "Which poll would you like to take?"
  Poll.print_polls
  choice = gets.chomp.to_i
  poll = Poll.find(choice)
  take_questions(poll)
end


def create_poll
  puts "What do you want to name your poll?"
  name = gets.chomp
  self.create_poll(name)
end

puts "What would you like to do?"
puts "1. Take poll"
puts "2. Create poll"
choice = gets.chomp
case choice
when "1" then take_poll
when "2" then create_poll
end


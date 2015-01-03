# Course 01 Lecture 01 Assignment: Paper Rock Scissors
# paperrockscissors.rb

require 'pry'

OPTIONS =
  { 'P' => 'Paper',
    'R' => 'Rock',
    'S' => 'Scissors' }

def display_victory_message(winning_choice)
  case winning_choice
  when 'R'
    puts 'The rock beats scissors'
  when 'S'
    puts 'The scissors beat paper'
  when 'P'
    puts 'The paper beats rock'
  end
end

user_score = 0
computer_score = 0

puts 'Play Paper Rock Scissors!'

loop do
  user_choice = ''
  loop do
    puts 'Choose one: (P/R/S)'
    user_choice = gets.chomp.upcase
    break if OPTIONS.keys.include?(user_choice)
  end
  computer_choice = OPTIONS.keys.sample

  puts "The computer picked #{OPTIONS[computer_choice]}."

  if user_choice == computer_choice
    puts 'It is a tie!'
  elsif (user_choice == 'R' && computer_choice == 'S') ||
        (user_choice == 'S' && computer_choice == 'P') ||
        (user_choice == 'P' && computer_choice == 'R')
    display_victory_message(user_choice)
    puts 'You win!'
    user_score += 1
  else
    puts 'The computer wins!'
    display_victory_message(computer_choice)
    computer_score += 1
  end

  puts "Score: You #{user_score}, Computer #{computer_score}"

  puts 'Play again?'
  again = gets.chomp.upcase
  break unless again == 'Y'
end
system 'clear'

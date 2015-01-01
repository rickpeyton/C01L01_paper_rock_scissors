# Course 01 Lecture 01 Assignment: Paper Rock Scissors
# paperrockscissors.rb

require 'pry'

options =
  { 'P' => 'Paper',
    'R' => 'Rock',
    'S' => 'Scissors' }

replies =
  { rock: 'The rock beats scissors',
    scissors: 'The scissors beat paper',
    paper: 'The paper beats rock',
    tie: 'The game is a tie' }

outcomes =
  { victory: 'You won!',
    defeat: 'The computer won!' }

def say(message)
  puts "==> #{message}"
end

user_score = 0
computer_score = 0

say('Play Paper Rock Scissors!')

loop do
  say('Choose one: (P/R/S)')
  user = gets.chomp.upcase
  computer = options.keys.shuffle.take(1).pop
  game = [user, computer]

  say("You picked #{options[user]}. The computer picked #{options[computer]}.")

  if %w(R S) == game.sort
    say("#{replies[:rock]}")
    if user == 'R'
      say("#{outcomes[:victory]}")
      user_score += 1
    else
      say("#{outcomes[:defeat]}")
      computer_score += 1
    end
  elsif %w(P S) == game.sort
    say("#{replies[:scissors]}")
    if user == 'S'
      say("#{outcomes[:victory]}")
      user_score += 1
    else
      say("#{outcomes[:defeat]}")
      computer_score += 1
    end
  elsif %w(P R) == game.sort
    say("#{replies[:paper]}")
    if user == 'P'
      say("#{outcomes[:victory]}")
      user_score += 1
    else
      say("#{outcomes[:defeat]}")
      computer_score += 1
    end
  else
    say("#{replies[:tie]}")
  end

  say("Score: You #{user_score}, Computer #{computer_score}")

  say('Play again?')
  again = gets.chomp.upcase
  break unless again == 'Y'
end

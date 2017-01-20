def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return 1 + rand(11)
end

def display_card_total(card_total)
  # this method will be called inside another method
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  sum_round = 0
  2.times do
    sum_round += deal_card
  end
  display_card_total(sum_round)
  return sum_round
end

def hit?(card_total)
  prompt_user
  keystroke = get_user_input
  if keystroke.downcase != "h" && keystroke.downcase != "s"
    invalid_command
    prompt_user
  elsif keystroke.downcase == "h"
    card_total += deal_card
    return card_total
  elsif keystroke.downcase == "s"
    return card_total
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  until card_total > 21 do
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end

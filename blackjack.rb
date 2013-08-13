#command line blackjack game

def calc_total(cards) 
arr = cards.map{|x| x[1]}

  total = 0
  arr.each do |v|
    if v == "A"
      total += 11
    elsif v.to_i == 0
      total += 10
    else 
      total += v.to_i
    end
end

arr.select{|x| x == "A"}.count.times do
  total -= 10 if total > 21
end

  total
end


puts "Welcome!"


suits = ['H', 'D', 'S', 'C']
cards = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck = suits.product(cards)
deck.shuffle! 


hand = []
house = []


hand << deck.pop
house << deck.pop
hand << deck.pop
house  << deck.pop


dtotal = calc_total(house)
mytotal = calc_total(hand)


puts "The Dealers hand: #{house[0]} and #{house[1]}, for a total of #{dtotal}"
puts "Your hand: #{hand[0]} and #{hand[1]}, for a total of: #{mytotal}"
puts ""

#Players turn
if mytotal == 21
	puts "BLACKJACK! WINNER! WINNER! CHICKENDINNER!"
	exit
end

while mytotal < 21
	puts "What now? 1) Hit 2) Stay"
    hit_stay = gets.chomp

    if !["1", "2"].include?(hit_stay)
    	puts "Error: Please enter 1 or 2"
    	next
    end

    if hit_stay == "2"
    	puts "Stay"
    	break
    end

    new_card = deck.pop
    puts "Dealing Card: #{new_card}"
    hand << new_card
    mytotal = calc_total(hand)
    puts "You now have: #{mytotal}"

    if mytotal == 21
    puts "BLACKJACK! WINNER! WINNER! CHICKENDINNER!"
	exit
	elsif mytotal > 21
	puts "BUST! LOSER!!!" 
	exit
    end
end

#Dealer turn
if dtotal == 21 
	puts "Dealer has BLACKJACK! You Lose!"
    exit
end

while dtotal < 17
	new_card = deck.pop
	puts "Dealing card for dealer: #{new_card}"
	house << new_card
	dtotal = calc_total(house)
	puts "Dealers total is now: #{dtotal}"

	if dtotal == 21
		puts "Sorry, dealer hit blackjack! YOU LOSE!!!"
		exit
	elsif dtotal > 21 
		puts "DEALER BUSTED!!! YOU WIN!!!"
		exit
	end
end


#Check hands
puts ""
puts "Dealer Cards: "
house.each { |c| puts "=> #{c}"}

puts "Your Cards: "
hand.each { |y| puts "=> #{y}"}
puts ""
if dtotal > mytotal 
	puts "HOUSE WINS! LOSER!"
elsif dtotal < mytotal
	puts "YOU WIN! WOOO HOOO!!!!!"
else
	puts "It's a draw! Missed it by... that.. much!"
end

exit


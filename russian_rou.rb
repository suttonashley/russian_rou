#Intro
puts "Welcome to Russian Roullette: a game for Wynners! [Press Enter]"

# create method for decorations
def firecracker
  100.times do |i|
    print '💥'.center(8)
  end
end

firecracker

gets

# request user name
puts "Enter your name please and then [Press Enter]:"

name = gets.chomp

firecracker

# Set up players
players = [
  {player: "player 1", is_shot: false},
  {player: "player 2", is_shot: false},
  {player: "player 3", is_shot: false},
  {player: "player 4", is_shot: false},
  {player: "player 5", is_shot: false},
  {player: "#{name}",  is_shot: false}
]

gets

# wish the user good luck
puts "Hello #{name}! I wish you luck! [Press Enter]"

gets

# Get initial number of players alive
players_alive = players.length

# define a method for our sound effects
def find_alive(players)
  alive = []
  players.each do |player|
    alive << player if player[:is_shot] == false
  end
  alive.length
end

# set a variable that we'll use to increment our Rounds
round = 1

# start the rounds & keep going while more than one player is alive or until user is dead
while (!players[5][:is_shot] && players_alive > 1)

  # say Round number
  puts "\nRound #{round}"
  gets

  # randomly place a bullet in the chamber
  bullet = rand(6)
  puts "Bullet is in chamber #{bullet}.🔫"

    # suspensful pause for 2 secs
    sleep(2)
  start_alive = find_alive(players)

  # randomly select a player to shoot
  players.each_with_index do |element, index|

    # if player is still alive
    unless element[:is_shot]
      # if bullet is equal to player turn then kill him in that round.
      if bullet == index
        puts "Bang!!! #{players[index][:player]} is dead 💥\n"
        # change player "is_shot" to true
        element[:is_shot] = true
        # subtract one player because they're dead
        players_alive = players_alive - 1
        # else the player is alive
      else
        puts "Click! #{players[index][:player]} is still alive!"
      end
    end
  end

  # if players at the start of the loop is = to players at end of the loop, play 'click', otherwise play 'dead'
  end_alive = find_alive(players)
  `afplay ./dead.mp3` if start_alive != end_alive
  `afplay ./gun_click.mp3` if start_alive == end_alive
  round += 1
end

# if user is the not the winner puts "Gone too soon...", otherwise puts "Nice...""
if players[5][:is_shot]
  if round > 1
    p "RIP #{name} -- Gone too soon, but you made it #{round - 1} Rounds!"
  else
    p "RIP #{name} -- Gone too soon, but you made it #{round - 1} Round!"
  end
else
  p "Nice #{name} -- You made it to the last round!"
end

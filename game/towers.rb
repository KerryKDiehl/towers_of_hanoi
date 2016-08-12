require 'byebug'
class TowersOfHanoi
  def initialize
    @towers = [
        [1,2,3],
        [],
        []
    ]
    @options = [0, 1, 2]
    @num_moves = 0
  end

  def display
    puts "Tower 1: #{@towers[0]}"
    puts "Tower 2: #{@towers[1]}"
    puts "Tower 3: #{@towers[2]}"
    puts "Total # of moves so far: #{@num_moves}"
  end

  def game_won
    @towers[2] === [1, 2, 3]
  end

  def start_over
    @towers = [
        [1,2,3],
        [],
        []
    ]
    @num_moves = 0
    puts "You have a fresh start!"
    display
  end

  def game
    until game_won
      puts 'What would you like to do next? Available commands are "display", "move", and "start over".'
      response = gets.chomp
      if response == "display"
        display
      elsif response == "start over"
        start_over
      else
        next_move
      end
    end
    puts "CONGRATS!!!  It only took you #{@num_moves} moves to win the Towers of Hanoi!"
  end

  def next_move
    from = move_from
    if @towers[from].length > 0
      to = move_to
      self.move(from, to)
    else
      puts "Whoops, that tower doesn't have any disks left in it!  This is what your towers
currently look like: "
      display
      next_move
    end
  end

  def move_from
    puts "Which tower do you want to move the next disk FROM? 1, 2, or 3?"
    tower = gets.chomp.to_i - 1
    if @options.include?(tower)
      tower
    else
      invalid_tower
      move_from
    end
  end

  def move_to
    puts "Which tower is this disk moving TO?  1, 2, or 3?"
    tower = gets.chomp.to_i - 1
    if @options.include?(tower)
      tower
    else
      invalid_tower
      move_to
    end
  end

  def invalid_tower
    puts "I didn't understand you.  Please enter 1, 2, or 3."
  end

  def move(from, to)
    disk = @towers[from].pop
    @towers[to].push(disk)
    @num_moves += 1
  end

end

tower = TowersOfHanoi.new
tower.game

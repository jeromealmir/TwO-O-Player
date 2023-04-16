require './Player'

class Game < Player  
  
  def initialize
    @player1 = Player.new("")
    @player2 = Player.new("")
    @rounds = 0
    @current_player = @player1
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  
  def random_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @sum = num1 + num2.to_i
    puts "#{@current_player.name}: What does #{num1} plus #{num2} equal? #{@sum}"
    @answer = gets.chomp.to_i
  end

  def get_winner
    winner = ""
    if @player1.lives > @player2.lives
      winner = @player1
    else
      winner = @player2
    end
    winner
  end
  
  def game_looper
    while @current_player.lives != 0 do
      random_question
      if @answer == @sum
        puts "YES! You are correct."
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        @current_player.score += 1
        switch_player
      else
        @current_player.lives -= 1
        puts "Seriously? No!"
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        switch_player
      end
    end
    puts "#{get_winner.name} wins with a score of #{get_winner.lives}/3"
    puts "---GAME OVER!---"
  end

  def start_game
    puts "---WELCOME TO TWO-O-PLAYER---"
    print "Enter Player 1 Name: "
    player1 = gets.chomp
    @player1.name = player1
    puts "Welcome #{@player1.name}!"
    print "Enter Player 2 Name: "
    player2 = gets.chomp
    @player2.name = player2
    puts "Welcome #{@player2.name}!"
    puts "Let the game begin!"
    game_looper
  end
end

game = Game.new

game.start_game

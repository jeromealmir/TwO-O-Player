require './Player'
require './Question'
require './Round'

class Game
  def initialize
    @player1 = Player.new("")
    @player2 = Player.new("")
    @round = Round.new(@player1, @player2)
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
    while @player1.lives != 0 && @player2.lives != 0 do
      @round.play
    end
      puts "#{get_winner.name} wins with a score of #{get_winner.score}/#{@round.rounds}"
      puts "---GAME OVER!---"
  end

  private
  
  def get_winner
    winner = ""
    @player1.lives > @player2.lives ? winner = @player1 : winner = @player2
    winner
  end
end

game = Game.new

game.start_game

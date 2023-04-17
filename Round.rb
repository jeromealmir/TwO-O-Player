class Round
  attr_reader :rounds

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    players = [player1, player2]
    @current_player = players[rand(0..1)]
    @rounds = 1
    @question = Question.new
  end

  def play
    loop do
      @rounds += 0.5
      if @question.ask(@current_player)
        @current_player.score += 1
      else
        @current_player.lives -= 1
      end
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      break if @player1.lives == 0 || @player2.lives == 0
      switch_player
    end
  end
  
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
    # generate new question on each player turn
    @question = Question.new
  end
end

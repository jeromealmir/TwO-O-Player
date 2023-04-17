class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = @num1 + @num2
  end

  def ask(player)
    puts "#{player.name}: What does #{@num1} plus #{@num2} equal?"
    answer = gets.chomp.to_i
    if answer == @sum
      puts "YES! You are correct."
      true
    else
      puts "Seriously? No!"
      false
    end
  end
end

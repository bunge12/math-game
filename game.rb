class Player
  attr_accessor :lives, :name
  def initialize(n)
    @name = n
    @lives = 3
  end
end
# Player class is initialized to track the lives and the name of player

class Question
  attr_accessor :a, :b, :answer
  def initialize
    @a = rand(1..20)
    @b = rand(1..20)
    @answer = @a + @b
  end
end
# Question class used to generate a question and an answer

class Turn
  def initialize(current)
    @current = current
  end

  def new_turn
    puts "----- NEW TURN -----" 
    question = Question.new
    a = question.a
    b = question.b
    @answer = question.answer
    puts "#{@current.name}> What does #{a} plus #{b} equal?"
    print "> "
    @choice = $stdin.gets.chomp
    if @answer == @choice.to_i 
      puts "#{@current.name}> You are correct!"
    else @current.lives -= 1
      puts "#{@current.name}> You are wrong! Answer: #{@answer}"
    end
    
  end

end
# To keep track of turns, current player, load new question

class Math_game
  def initialize 
    @current = nil
    @winner = nil
    @p1 = Player.new("P1")
    @p2 = Player.new("P2")
  end

  def start
  puts "Welcome to the Math game"
  puts "Answer addition questions. Simple."
  puts "#{@p1.name} and #{@p2.name}, are you ready?"

    until @winner
      if @current.nil? 
        @current = @p1 
      elsif @current == @p1
      @current = @p2
      elsif @current == @p2
      @current = @p1
      end
      turn = Turn.new(@current)
      turn.new_turn
      if @p1.lives == 0
        @winner = @p2
      elsif @p2.lives == 0
        @winner = @p1
      end
        if @winner.nil?
          puts "Scores> P1: #{@p1.lives}/3 | P2: #{@p2.lives}/3"
        else puts "----- GAME OVER -----\n#{@winner.name} wins with a score of #{@winner.lives}/3!\nGood bye!"
        end
    end
  end


end
# Contains user IO and game loop

game = Math_game.new
game.start
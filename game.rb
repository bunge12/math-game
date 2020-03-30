class Player
  attr_accessor :lives, :name
  def initialize(n)
    @name = n
    @lives = 3
  end
end
# Player class is initialized to track the lives and the name of player

class Question 
end
# Question class used to generate each question

class Turn
end
# To keep track of turns, current player, load new question

class Math_game
  def start
  puts "Welcome to the Math game"
  puts "Answer 3 addition questions. Simple."
  end

end
# Contains user IO and game loop

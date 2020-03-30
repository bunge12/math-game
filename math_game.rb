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
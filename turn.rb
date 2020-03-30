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
# To generate new turn, load new question
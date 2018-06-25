class Joke
  attr_accessor :id
  attr_accessor :question
  attr_accessor :answer
  
  def initialize(joke_data)
    @id = joke_data[:id]
    @question = joke_data[:question]
    @answer = joke_data[:answer]
  end
end

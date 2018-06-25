class User
  attr_reader :name
  attr_reader :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    # Take advantage of if's truthiness and exclude nil jokes
    @jokes.push(joke) if joke
  end

  def tell(user, joke)
    user.jokes.push(joke)
  end

  def perform_routine_for(user)
    @jokes.each do |joke|
      tell(user, joke)
    end
  end

  def learn_routine(filename)
    if !File.zero?(filename) # true if file is empty or does not exist
      file = File.open(filename)
      # remove header line
      file.gets
      # lines is depracated, need to find another way
      # lines = file.lines  # An enumerator
      # lines.next
      # lines.each do |joke|
      file.each_line do |joke|
        joke_data = joke.chomp.split(", ")
        learn(Joke.new({id: joke_data[0], :question => joke_data[1], answer: joke_data[2]}))
      end
    end
  end
end

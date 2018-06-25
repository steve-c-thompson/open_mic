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
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test
  def test_joke_exists
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    assert_instance_of(Joke, joke)
  end
  def test_joke_initialized_with_hash_params
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    assert_equal(joke.id, 1)
    assert_equal(joke.question, "Why did the strawberry cross the road?")
    assert_equal(joke.answer, "Because his mother was in a jam.")
  end
end

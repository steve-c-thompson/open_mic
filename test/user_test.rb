require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_is_initialized_with_empty_array_of_jokes
    sal = User.new("Sal")
    assert_instance_of Array, sal.jokes
    assert_equal 0, sal.jokes.length
  end

  def test_it_can_learn_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)
    refute_nil sal.jokes
    assert_equal 1, sal.jokes.length
    refute_nil sal.jokes[0]
  end

  def test_it_can_learn_only_non_nil_jokes
    sal = User.new("Sal")
    sal.learn(nil)
    refute_nil sal.jokes
    assert_equal 0, sal.jokes.length
  end

  def test_users_can_tell_jokes_to_other_users
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.tell(ali, joke)
    assert_equal 1, ali.jokes.count
    assert_equal 1, ali.jokes[0].id
  end

  def test_users_can_perform_routines_and_give_all_jokes_to_other_user
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana = User.new("Ilana")
    josh = User.new("Josh")

    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)
    assert_equal 2, josh.jokes.count
    assert_equal 1, josh.jokes[0].id
    assert_equal 2, josh.jokes[1].id
  end
end

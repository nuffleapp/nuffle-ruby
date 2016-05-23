if ENV['CI'] == 'true'
  require 'simplecov'
  SimpleCov.start

  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'minitest/autorun'
require File.expand_path('../../lib/nuffle', __FILE__)

class TestNuffle < Minitest::Test

  # Test valid rolls
  # 
  # Testing a random number generator is weird. To accomplish this, we
  # pre-generate a list of expected results based on a pre-defined seed (1)
  # and test the roll() method against each element in the set.
  def test_valid_rolls
    equations = {0 => 0, 20 => 20, '20' => 20, '20 + 10' => 30, '20 / 10' => 2, '20 - 10' => 10, '20 * 10' => 200, '1d20' => 6, '1d20 + 20' => 32, '1d20 + 2d6' => 16, '2d6' => 10, '(1d20 - 20) / 3d10' => -1, '((1d20 - 20) / 3d10) - 3d10' => -14.28, '((1d20 - 20) / 3d10) - 3d10 * 15' => -390.0769230769231, '1d20 * 1d6' => 18, '1d20 / 1d6' => 7, '1d20 - 1d6' => 4 }

    srand(1)

    equations.each do |equation, result|
      roll = Nuffle.roll(equation)

      assert_equal result, roll.result
    end
  end

  # Test missing input
  def test_invalid_equations
    err = assert_raises RuntimeError do
      Nuffle.roll()
    end

    assert_equal "Input can't be blank.", err.message
  end

  # Test invalid equations
  def test_invalid_equations
    [20.5, ")", "(", "0d0", "0d1", "1d0", "d1", "1d", "1d20 +", "+ 1d20", "1d20 -", "- 1d20", "1d20 /", "/ 1d20", "1d20 *", "* 1d20", "nuffle"].each do |sides|
      err = assert_raises RuntimeError do
        Nuffle.roll(sides)
      end

      assert_equal "Invalid equation.", err.message
    end
  end

  # Test unbalanced equations
  def test_unbalanced_equations
    ["((1d20)", "(1d20))"].each do |sides|
      err = assert_raises RuntimeError do
        Nuffle.roll(sides)
      end

      assert_equal "Unbalanced parens.", err.message
    end
  end

  # Test invalid object types
  def test_invalid_object_types
    [true, {}, []].each do |sides|
      err = assert_raises RuntimeError do
        Nuffle.roll(sides)
      end

      assert_equal "Input must be an equation or a number.", err.message
    end
  end
end
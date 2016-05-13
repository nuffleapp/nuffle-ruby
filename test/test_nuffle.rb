require 'minitest/autorun'
require 'nuffle'

class TestNuffle < Minitest::Test

  # Test valid rolls
  # 
  # Testing a random number generator is weird. To accomplish this, we
  # pre-generate a list of expected results based on a pre-defined seed (1)
  # and test the roll() method against each element in the set.
  def test_valid_rolls
    results = [2, 2, 4, 1, 1, 2, 5, 8, 7, 10, 3, 5, 6, 3, 5, 12, 11, 15, 19]

    (2..20).each_with_index do |sides, key|
      result = Nuffle.roll(sides)

      assert_operator result, :>=, 1
      assert_operator result, :<=, sides
      assert_equal results[key], result
    end
  end

  # Test invalid rolls
  def test_invalid_rolls
    [-1, 0, 1, "troll", 20.5, nil, :troll, true, false, "20", [], {}].each do |sides|
      err = assert_raises RuntimeError do
        Nuffle.roll(sides)        
      end

      assert_equal "Invalid number of sides.", err.message
    end
  end
end
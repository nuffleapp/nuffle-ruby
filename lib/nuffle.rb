class Nuffle

  # Roll an x-sided dice
  def self.roll(x)
    # validate
    raise "Invalid number of sides." if !x.is_a?(Integer) || x < 2

    # roll
    return 1 + rand(x);
  end
end

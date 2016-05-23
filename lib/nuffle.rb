class Nuffle

  def self.roll(x = '')
    ::Nuffle::Calculator.new(x).calculate
  end
end

class Nuffle::Calculator

  attr_reader :input,
              :rolls,
              :equation,
              :result

  def initialize(input)
    validate(input)
  end

  def calculate
    # reset the rolls array
    @rolls = []

    # throw rolls and replace 'xdy' dice notation with results
    @equation = @input.gsub(/(\d+)d(\d+)/) do |match|
      rolls = []

      (1..$1.to_i).each do
        rolls << 1 + rand($2.to_i)
      end

      # save individual roll results
      @rolls << {
          'notation' => match,
          'rolls' => rolls
        }

      "(#{rolls.join(" + ")})"
    end

    # cast integers to floats
    equation = @equation.gsub(/\b(\d+)\b/) do |match|
      $1.to_f.to_s
    end

    # calculate result
    @result = eval(equation);

    # cast result to integer if a whole float
    @result = @result.to_i if @result % 1 == 0

    self
  end

  private

  def validate(input)
    # has to be something we can calculate
    raise("Input must be an equation or a number.") unless input.is_a?(String) || input.is_a?(Numeric)

    # no empty inputs
    raise("Input can't be blank.") if input.to_s.strip == ''

    # cast input to a string
    input = input.to_s

    # validate the input format
    raise("Invalid equation.") unless /^[\(\s]*(([1-9][0-9]*d[1-9][0-9]*)|\d+)[\s\)]*(\s*([\-\+\*\/])[\s\(]*(([1-9][0-9]*d[1-9][0-9]*)|\d+)\)*)*$/i.match(input)

    # make sure the parens are balanced
    raise("Unbalanced parens.") unless is_balanced?(input)

    @input = input
  end

  def is_balanced?(input)
    balance = 0

    input.split("").each do |char|
      if char == '('
        balance += 1
      elsif char == ')'
        balance -= 1
      end

      # found a close paren without a matching open paren,
      # no need to continue further
      if balance < 0
        break
      end
    end

    return balance === 0
  end
end
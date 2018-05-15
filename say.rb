class Say
  NUMBERS = {
    1_000_000_000 => 'billion', 1_000_000 => 'million', 1000 => 'thousand', 100 => 'hundred',
    90 => 'ninety', 80 => 'eighty', 70 => 'seventy', 60 => 'sixty', 50 => 'fifty', 40 => 'forty', 30 => 'thirty', 20 => 'twenty',
    19 => 'nineteen', 18 => 'eighteen', 17 => 'seventeen', 16 => 'sixteen', 15 => 'fifteen', 14 => 'fourteen', 13 => 'thirteen', 12 => 'twelve', 11 => 'eleven',
    10 => 'ten', 9 => 'nine', 8 => 'eight', 7 => 'seven', 6 => 'six', 5 => 'five', 4 => 'four', 3 => 'three', 2 => 'two', 1 => 'one', 0 => 'zero'
  }.freeze
  MIN = 0
  MAX = 999_999_999_999

  def initialize(number)
    @number = number
    @number_string = ''
  end

  def in_english
    raise ArgumentError unless @number.between? MIN, MAX
    return 'zero' if @number.zero?
    highest_number_less_than = NUMBERS.keys.find { |n| n <= @number }
    multiplier = @number / highest_number_less_than
    if multiplier > 0 && highest_number_less_than > 99
      @number -= highest_number_less_than * multiplier
      @number_string << "#{Say.new(multiplier).in_english} "
      @number_string << "#{NUMBERS[highest_number_less_than]} "
    else
      @number -= highest_number_less_than
      if highest_number_less_than.between? 20, 90
        @number_string << "#{NUMBERS[highest_number_less_than]}-"
      else
        @number_string << "#{NUMBERS[highest_number_less_than]} "
      end
    end
    if @number.zero?
      @number_string.gsub(/(\s|-)$/, '')
    else
      in_english
    end
  end
end

module BookKeeping
  VERSION = 1
end

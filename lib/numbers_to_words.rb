class Fixnum

  ones = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
          6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
          11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
          15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
          19 => "nineteen"}

  tens = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
          6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}

  define_method(:numbers_to_words) do
    digits = self.to_s.split('').map { |digit| digit.to_i }
    words = []
    if (self < 20)
      ones_to_words
    elsif (self < 100)
      tens_to_words(digits, words)
    elsif (self < 1000)
      hundreds_to_words(digits, words)
    else
      "under construction"
    end
  end

  define_method(:ones_to_words) do
    ones.fetch(self)
  end

  define_method(:tens_to_words) do |digits, words|
    words.push(tens.fetch(digits[0]))
    words.push(ones.fetch(digits[1])) unless digits[1] == 0
    words.join(" ")
  end

  define_method(:hundreds_to_words) do |digits, words|
    words.push(digits.shift.ones_to_words() + " hundred")
    tens_to_words(digits, words)

  end
end

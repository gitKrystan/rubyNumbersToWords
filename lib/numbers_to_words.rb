class Fixnum
  define_method(:numbers_to_words) do
    digits = self.to_s.split('').map { |digit| digit.to_i }
    words = []
    if (self < 20)
      digits.ones_to_words()
    elsif (self < 100)
      digits.tens_to_words(words)
    elsif (self < 1000)
      digits.hundreds_to_words(words)
    elsif (self < 100000)
      digits.thousands_to_words(words)
    else
      "under construction"
    end
  end
end

class Array
  ones = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
          6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
          11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
          15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
          19 => "nineteen"}

  tens = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
          6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}

  define_method(:ones_to_words) do
    ones.fetch(self.join.to_i)
  end

  define_method(:tens_to_words) do |words|
    tens_place = self.join.to_i
    if tens_place > 19
      words.push(tens.fetch(self[0]))
      words.push(ones.fetch(self[1])) unless self[1] == 0
    else
      words.push(ones.fetch(tens_place))
    end
    words.join(" ")
  end

  define_method(:hundreds_to_words) do |words|
    words.push(self.slice!(0, self.length - 2).ones_to_words() + " hundred")
    self.tens_to_words(words)
  end

  define_method(:thousands_to_words) do |words|
    self.slice!(0, self.length - 3).tens_to_words(words)
    words.push("thousand")
    self.hundreds_to_words(words)
  end
end

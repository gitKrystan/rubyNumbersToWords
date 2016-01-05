class Fixnum

  ones = {0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
          6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}

  define_method(:numbers_to_words) do
    ones_to_words
  end

  define_method(:ones_to_words) do
    ones.fetch(self)
  end

end

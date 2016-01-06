class Fixnum
  triplet_names = ["", " thousand ", " million ", " billion ", " trillion "]

  words_to_nineteen = {0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
          6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
          11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
          15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
          19 => "nineteen"}

  words_for_tens = {0 => "", 1 => "ten", 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
          6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}

  define_method(:numbers_to_words) do |number_words = " ", triplet_number = 0|
    if triplet_number == 0 && self == 0
      return "zero"
    end

    number_as_array = self.to_s.split("")

    last_triplet = number_as_array
      .slice!([number_as_array.length, 3].min * -1,3)
      .join()
      .to_i

    last_triplet_in_words = last_triplet.triplet_to_words()
    triplet_modifier = ""

    if (last_triplet_in_words.length > 0)
      triplet_modifier = triplet_names[triplet_number]
    end

    new_number_words = last_triplet_in_words \
      + triplet_modifier \
      + number_words

    if (number_as_array.length == 0)
      return new_number_words.strip()
    end

    return number_as_array
      .join()
      .to_i()
      .numbers_to_words(new_number_words, triplet_number + 1)
  end

  define_method(:triplet_to_words) do
    triplet_digits = self.to_s.rjust(3,"0").split('').map { |digit| digit.to_i }
    triplet_words = ""
    if self < 20
      triplet_words += words_to_nineteen[self]
    else
      triplet_words += words_for_tens[triplet_digits[1]] \
        + " " + words_to_nineteen[triplet_digits[2]]
    end

    if self >= 100
      triplet_words = words_to_nineteen[triplet_digits[0]] \
        + " hundred " + triplet_words
    end

    return triplet_words.strip()
  end
end

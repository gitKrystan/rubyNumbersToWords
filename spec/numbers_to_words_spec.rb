require('rspec')
require('numbers_to_words')
require('pry')

describe('Fixnum#numbers_to_words') do
  it("returns zero for 0") do
    expect(0.numbers_to_words()).to(eq("zero"))
  end

  it("returns a written number for a single digit numeral") do
    expect(4.numbers_to_words()).to(eq("four"))
  end

  it("returns a written number for a number between ten and twenty") do
    expect(13.numbers_to_words()).to(eq("thirteen"))
  end

  it("returns a written number for a two digit number") do
    expect(42.numbers_to_words()).to(eq("forty two"))
  end

  it("returns a written number for a two digit number") do
    expect(40.numbers_to_words()).to(eq("forty"))
  end

  it("returns a written number for a three digit number") do
    expect(178.numbers_to_words()).to(eq("one hundred seventy eight"))
  end

  it("returns a written number for a three digit number with zero in the ones place") do
    expect(110.numbers_to_words()).to(eq("one hundred ten"))
  end

  it("returns a written number for a four digit number with zero in the ones place") do
    expect(1110.numbers_to_words()).to(eq("one thousand one hundred ten"))
  end

  it("returns a written number for a four digit number with zero in the ones and hundreds place") do
    expect(1010.numbers_to_words()).to(eq("one thousand ten"))
  end

  it("returns a written number for a three digit number ending in zeroes") do
    expect(100.numbers_to_words()).to(eq("one hundred"))
  end

  it("handles a three digit number that ends in zero") do
    expect(150.numbers_to_words()).to(eq("one hundred fifty"))
  end

  it("returns a written number for a four digit number") do
    expect(9267.numbers_to_words()).to(eq("nine thousand two hundred sixty seven"))
  end

  it("returns a written number for a four digit number ending in zeroes") do
    expect(1000.numbers_to_words()).to(eq("one thousand"))
  end

  it("returns a written number for a five digit number below twenty thousand") do
    expect(18526.numbers_to_words()).to(eq("eighteen thousand five hundred twenty six"))
  end

  it("returns a written number for a five digit number above twenty thousand") do
    expect(99999.numbers_to_words()).to(eq("ninety nine thousand nine hundred ninety nine"))
  end

  it("returns a written number for a six digit number") do
    expect(120350.numbers_to_words()).to(eq("one hundred twenty thousand three hundred fifty"))
  end

  it("returns a written number for a six digit number with zero hundreds") do
    expect(600037.numbers_to_words()).to(eq("six hundred thousand thirty seven"))
  end

  it("returns one trillion when given a nine digit number") do
    expect(1000000000000.numbers_to_words()).to(eq("one trillion"))
  end
end

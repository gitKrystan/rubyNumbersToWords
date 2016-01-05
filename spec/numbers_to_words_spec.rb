require('rspec')
require('numbers_to_words')
require('pry')

describe('Fixnum#numbers_to_words') do
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
end

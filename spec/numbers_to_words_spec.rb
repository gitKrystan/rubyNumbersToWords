require('rspec')
require('numbers_to_words')
require('pry')

describe('Fixnum#numbers_to_words') do
  it("return a written number for a single digit numeral") do
    expect(4.numbers_to_words()).to(eq("four"))
  end
end

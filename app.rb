require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/numbers_to_words')
require('pry')

get('/') do
	erb(:index)
end

get('/words') do
	@number_words = params.fetch('numerals').to_i.numbers_to_words()
	erb(:words)
end

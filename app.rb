require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')
require('pry')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/new') do
  erb(:word_form)
end

post('/') do
  word = params.fetch('word')
  Word.new({:word => word}).save()
 @words = Word.all()
 erb(:index)
end

get('/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_form)
end

post('/:id') do
  word = Word.find(params.fetch('id').to_i())
  @word = word
  defined_word = params.fetch('defined_word')
  @definition = Definition.new({:defined_word => defined_word})
  word.add_definition(@definition)
  erb(:word)
end

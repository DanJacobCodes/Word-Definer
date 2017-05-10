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


require_relative 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    author = params['gossip_author'] # Récupérer l'auteur du formulaire
    content = params['gossip_content'] # Récupérer le contenu du formulaire
    gossip = Gossip.new(author, content)
    gossip.save
    redirect '/'
  end
  
  get '/gossips/:id' do
    erb :show
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['name'] is 'foo' or 'bar'
    # n stores params['name']
    
  end


end



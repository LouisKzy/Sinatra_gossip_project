
require_relative 'gossip'
class ApplicationController < Sinatra::Base
  def initialize
    super
    
    
    csv_file = File.join('db', 'gossip.csv')
    CSV.foreach(csv_file) do |row|
      author, content = row
    Gossip.new(author, content)
    end

  end
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
    id = params['id']
    gossip = Gossip.find(id)
    if gossip
      erb :show, locals: { gossips: gossip }
    else 
      "Potin non trouvé"
    end
  end


end



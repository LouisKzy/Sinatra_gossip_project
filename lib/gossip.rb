require 'csv'
require 'pry'
class Gossip
  attr_accessor :author, :content, :id
  @@count_id = 0
  @@instances = []
  
  def initialize(author, content)
    @@count_id += 1
    @id = @@count_id
    @author = author
    @content = content
    @@instances << self
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
    # csv_file = File.join('db', 'gossip.csv')
    
    # gossips = []
    
    # CSV.foreach(csv_file) do |row|
    #   author, content = row
    #   gossips << Gossip.new(author, content)
    # end
    # gossips
    return @@instances
  end

  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[(id.to_i-1)] if (id.to_i-1).between?(0, all_gossips.length - 1)
  end
  
end
# binding.pry
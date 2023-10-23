require 'csv'
require 'pry'
class Gossip
  attr_accessor :author, :content
  
  def initialize(author, content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
    csv_file = File.join('db', 'gossip.csv')
    
    gossips = []
    
    CSV.foreach(csv_file) do |row|
      author, content = row
      gossips << Gossip.new(author, content)
    end
    gossips
  end
  
  def self.find(id)
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      if index == id
        return csv_line
      end
    end
  end
  
end
binding.pry
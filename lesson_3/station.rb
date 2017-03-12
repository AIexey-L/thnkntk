require_relative './train.rb'
require_relative './route.rb'

class Station
  attr_reader :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end
    
  def send_train(train)
    @trains.delete(train)
    puts "Train #{train} departed"
  end
  
  def set_train(train)
    @trains << train
    puts "Train #{train} arrived"
  end
  
  def type(type_of_train)
    @trains.find_all { |train| train.type == type_of_train }
  end
  
end

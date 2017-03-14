require_relative 'main'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'

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
  
  def trains_by_type(type)
    @trains.find_all { |train| train.type == type }
  end
  
end

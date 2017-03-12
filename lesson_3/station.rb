require_relative './train.rb'
require_relative './station.rb'

class Station
  
  attr_reader :station_name, :trains
  
  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end
    
  def send_train(train)
    @trains.delete(train)
    puts "Train #{train} departed"
  end
  
  def get_train(train)
    @trains << train
    puts "Train #{train} arrived"
  end
  
  def trains_by_type(type_of_train)
    @trains.find_all { |x| x.type == type_of_train }
  end
  
end

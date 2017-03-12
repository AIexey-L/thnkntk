require_relative './station.rb'
require_relative './train.rb'

class Route

  attr_reader :route
  
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @route = [first_station, last_station]
  end
  
  def add_station(add_station)
    @route.insert(1, add_station)
  end
  
  def delete_station(delete_station)
    @route.delete(delete_station)
  end
  
end


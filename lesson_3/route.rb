require_relative './station.rb'
require_relative './train.rb'

class Route
  attr_reader :stations
  
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end
  
  def add_station(add_station)
    @stations.insert(-2, add_station)
  end
  
  def delete_station(delete_station)
    @stations.delete(delete_station)
  end
  
end


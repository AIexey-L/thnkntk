require_relative 'main'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'

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


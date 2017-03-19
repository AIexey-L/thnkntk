class Route
  
  attr_reader :stations
  
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
  end
  
  def add_station(add_station)
    @stations.insert(-2, add_station)
  end
  
  def delete_station(delete_station)
    @stations.delete(delete_station)
  end

  private

  def validate!
    raise 'station is not valid' unless @stations.all? { |station| station.is_a?(Station) }
    true
  end
  
end


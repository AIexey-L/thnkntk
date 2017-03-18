class Route
  
  attr_reader :stations
  
  def initialize(first_station, last_station)
    validate!
    @stations = [first_station, last_station]
  end
  
  def add_station(add_station)
    @stations.insert(-2, add_station)
  end
  
  def delete_station(delete_station)
    @stations.delete(delete_station)
  end

  private

  def validate!
    raise 'station is not valid' unless first_station.is_a?(Station) && last_station.is_a?(Station)
    true
  end
  
end


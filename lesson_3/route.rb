require_relative './station.rb'
require_relative './train.rb'

class Route
  def initialize(first_station, last_station)
    @first_station = [first_station]
    @last_station = [last_station]
    @intermediate_stations_list = []
    @full_list = []
  end
  def add_station(add_station)
    @intermediate_stations_list << add_station
  end
  def delete_station(delete_station)
    @intermediate_stations_list.delete(delete_station)
  end
  def list_stations


    # "#{@first_station}, #{@intermediate_stations_list.join(", ")}, #{@last_station}"
    @full_list =  @first_station +  @intermediate_stations_list + @last_station
  end
end

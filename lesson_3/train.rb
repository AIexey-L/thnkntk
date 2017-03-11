require_relative './station.rb'
require_relative './route.rb'

class Train
  attr_reader :speed, :carriage_count, :type, :number
  attr_writer :route
  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
    @route
    @current_station
  end
  def accelerate(speed)
    @speed += speed
  end
  def brake
    @speed = 0
  end
  def attach_carriage
    @carriage_count += 1 if @speed == 0
  end
  def detach_carriage
    @carriage_count -= 1 if @speed == 0
  end
  def goto_station(station)
    if @route.list_stations.include?(station)
      @current_station = station
    else
      puts 'no such station or no route loaded'
    end
  end
  def prev_next_stations
    i = @route.list_stations.index(@current_station)
    if i == @route.list_stations.length - 1
      puts "previouse station - #{@route.list_stations[i-1]}"
      puts "current station - #{@route.list_stations[i]}"
    elsif i == 0
      puts "current_station - #{@current_station}"
      puts "next station - #{@route.list_stations[i+1]}"
    else
      puts "previouse station - #{@route.list_stations[i-1]}"
      puts "current_station - #{@current_station}"
      puts "next station - #{@route.list_stations[i+1]}"
    end
  end
end

chuhchuh = Train.new('123', 'pass', 23)

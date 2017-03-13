require_relative './station.rb'
require_relative './route.rb'

class Train
  attr_reader :speed, :carriage_count, :type, :number

  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
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
    @carriage_count -= 1 if @speed == 0 && @carriage_count >= 0
  end

  def set_route(set_route)
    @route = set_route
    @index_current_station = 0
  end

  def go_forward
    if @route && @index_current_station < @route.stations.length - 1
      @index_current_station += 1
      move
    else
      puts 'No route loaded or no next station!'
    end
  end

  def go_backward
    if @route && @index_current_station - 1 >= 0
      @index_current_station -= 1
      move
    else
      puts 'No route loaded or no previouse station'
    end
  end
  
  def next_station
    if @route && @index_current_station < @route.stations.length - 1
      @route.stations[@index_current_station+1]
    else
      puts 'No route loaded or No next station, end of the line'
    end
  end
  
  def previouse_station
    if @route && @index_current_station - 1 >= 0
    @route.stations[@index_current_station-1]
    else
      puts 'No route loaded or No previouse station, beginning of the line'
    end
  end

  def current_station
    if @route
      @route.stations[@index_current_station]
    else
      puts 'No route loaded, no current station'
    end
  end

  def move
    @route.stations[@index_current_station].set_train(self)
    @route.stations[@index_current_station - 1].send_train(self)
  end
      
end

require_relative './station.rb'
require_relative './route.rb'

class Train
  
  attr_reader :speed, :carriage_count, :type, :number, :current_station

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

  def get_route(get_route)
    @route = get_route
    @i = 0
    @current_station = @route.route[@i]
  end

  def go_forward
    if @route && @i < @route.route.length - 1
      @current_station = @route.route[@i += 1]
    else
      puts 'No route loaded or no next station!'
    end
  end

  def go_backward
    if @route && @i - 1 >= 0
      @current_station = @route.route[@i -= 1]
    else
      puts 'No route loaded or no previouse station'
    end
  end
  
  def next_station
    if @route && @i < @route.route.length - 1
      @route.route[@i+1]
    else
      puts 'No next station, end of the line'
    end
  end
  
  def previouse_station
    if @route && @i - 1 >= 0
    @route.route[@i-1]
    else
      puts 'No previouse station, beginning of the line'
    end
  end
    
end

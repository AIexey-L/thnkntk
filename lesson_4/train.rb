require_relative './station.rb'
require_relative './route.rb'
# require_relative './passenger_train.rb'
# require_relative './cargo_train.rb'
# require_relative './passenger_carriage.rb'
# require_relative './cargo_carriage.rb'

class Train
  attr_reader :speed, :carriages, :type, :number

  def initialize(number)
    @number = number
    @type = self.class
    @carriages = []
    @speed = 0
  end

  protected

  
  # following methods are protected because they are using only by Train subclasses
  def accelerate(speed)
    @speed += speed
  end
  
  def brake
    @speed = 0
  end
  
  def attach_carriage(carriage)
    @carriages << carriage if @speed.zero?
  end
  
  def detach_carriage(carriage)
    @carriages.delete(carriage) if @speed.zero? && @carriages.length > 0
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

  private
  
  # private  because move uses only in Train class, it's a helper method
  # for go_forward and go_backward methods
  def move
    @route.stations[@index_current_station].set_train(self)
    @route.stations[@index_current_station - 1].send_train(self)
  end
      
end

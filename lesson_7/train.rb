require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'station'

class Train
  attr_reader :speed, :carriages, :type, :number
  @@all = {}

  VALID_TRAIN_NUMBER = /^[a-z0-9]{3}-*[a-z0-9]{2}/i
  
  include Manufacturer
  include InstanceCounter::InstanceMethods
  extend InstanceCounter::ClassMethods
  
  def initialize(number)
    @number = number
    validate!
    @type = self.class
    @carriages = []
    @speed = 0
    @@all[number] = self
    register_instance
  end

  def self.find(number)
    @@all[number]
  end

  def accelerate(speed)
    @speed += speed
  end
  
  def brake
    @speed = 0
  end
  
  def attach_carriage(carriage)
    @carriages << carriage if @speed.zero? && carriage_valid_or_exist?(carriage)
  end
  
  def detach_carriage(carriage)
    @carriages.delete(carriage) if @speed.zero? && carriage_valid_or_exist?(carriage)
  end

  def set_route(set_route)
    @route = set_route
    @index_current_station = 0
  end

  def go_forward
    @index_current_station += 1 if next_station_exist?
    move
  end

  def go_backward
    @index_current_station -= 1 if previouse_station_exist?
    move
  end
  
  def next_station
    @route.stations[@index_current_station+1] if next_station_exist?
  end
  
  def previouse_station
    @route.stations[@index_current_station-1] if previouse_station_exist?
  end

  def current_station
    raise 'No route loaded, no current station' unless @route
    @route.stations[@index_current_station]
  end

  def valid?
    validate!
  rescue
    true
  end

  def each_carriage
    carriages.each.with_index(1) do |car, index|
      yield(car, index)
    end
  end
    
  private
  
  # private  because move uses only in Train class, it's a helper method
  # for go_forward and go_backward methods
  def move
    @route.stations[@index_current_station].set_train(self)
    @route.stations[@index_current_station - 1].send_train(self)
  end

  def same_type_carriage?(carriage)
    raise 'wrong type of carriage' unless carriage.is_a?(PassengerCarriage) && self.is_a?(PassengerTrain) || carriage.is_a?(CargoCarriage) && self.is_a?(CargoTrain)
    true
  end

  def validate!
    raise 'Number is not valid!' if number !~ VALID_TRAIN_NUMBER
    true
  end

  def carriage_valid_or_exist?(carriage)
    raise "Carriage with wrong type or don\'t exist" unless same_type_carriage?(carriage) || @carriages.length > 0
    true
  end

  def next_station_exist?
    raise 'Route not assigned or no next station' unless @route && @index_current_station < @route.stations.length - 1
    true
  end

  def previouse_station_exist?
    raise 'Route not assigned or no next station' unless @route &&  @index_current_station - 1 >= 0
    true
  end

end

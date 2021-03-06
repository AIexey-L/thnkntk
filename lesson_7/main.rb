require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'

class Application

  def initialize
    @stations_collection = []
    @trains_collection = []
    @routs_collection = []
  end

  def make_station(station)
    @stations_collection << Station.new(station) 
  end

  def make_passenger_train(number)
    @trains_collection << PassengerTrain.new(number)
  end

  def make_cargo_train(number)
      @trains_collection << CargoTrain.new(number)
  end

  def make_route(f_station, l_station)
    if station_exist?(f_station) && station_exist?(l_station)
      @routs_collection << Route.new(get_station(f_station), get_station(l_station))
    end
  end

  def assign_route(train_number, f_station, l_station)
    get_train(train_number).set_route(get_route(f_station, l_station)) if route_exist?(f_station, l_station)
  end
  
  def add_carriage(train_number)
    get_train(train_number).attach_carriage(@carriage) if train_exist?(train_number)
  end

  def remove_carriage(train_number)
    if train_exist?(train_number) && train_has_any_carriages?(train_number)
      @carriage = get_train(train_number).carriages.last
      get_train(train_number).detach_carriage(@carriage)
    end
  end

  def move_forward(train_number)
    get_train(train_number).go_forward if train_exist?(train_number)
  end
  
  def move_backward(train_number)
    get_train(train_number).go_backward if train_exist?(train_number)
  end

  def see_stations
    @stations_collection.each { |station| puts "station: #{station.name}" }
  end

  def see_trains_on_station(station)
    get_station(station).each_train { |trn| puts "Train number #{trn.number}  #{trn.type} with #{trn.carriages.count} carriage(s)" }
  end
  
  def make_passenger_carriage(seats)
      @carriage = PassengerCarriage.new(seats)
  end

  def make_cargo_carriage(total_volume)
      @carriage = CargoCarriage.new(total_volume)
  end

  def see_train(train_number)
    train = @trains_collection.find { |trn| trn.number == train_number }
    if train.is_a? PassengerTrain
      train.each_carriage { |carr, carriage_number| puts "Carriages:  #{carr.class} number #{index} has #{carr.free_seats} free seats and #{carr.seats_taken} seats taken"}
    elsif train.is_a? CargoTrain
      train.each_carriage { |carr, carriage_number| puts "Carriages:  #{carr.class} number #{index} has #{carr.free_volume} free volume and #{carr.volume_occupeid} volume occupeid"}
    end
  end
    
      private
      
  # following methods are protected because they are inner methods for use only in Application
  # and don't need to be visible outside by client's code
  
  def station_exist?(station)
    raise "station don\'t exist" unless get_station(station)
    true
  end

  def train_exist?(trn)
    raise "train don\'t exist" unless get_train(trn)
    true
  end

  def route_exist?(first_station, last_station)
    raise "route don\'t exist" unless get_route(first_station, last_station)
    true
  end

  def get_route(first_station, last_station)
    @routs_collection.find { |route| route.stations.first.name == first_station && route.stations.last.name == last_station }
  end
  
  def get_train(train_number)
    @trains_collection.find { |train| train.number.to_i == train_number.to_i }
  end

  def get_station(stat)
    @stations_collection.find { |station| station.name == stat }
  end

  def train_has_any_carriages?(train_number)
    raise 'train has no carriages' if get_train(train_number).carriages.last.nil?
    true
  end
end


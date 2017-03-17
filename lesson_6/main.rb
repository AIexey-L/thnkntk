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

  def make_route
    puts 'enter first station'
    f_station = gets.chomp
    puts 'enter last station'
    l_station = gets.chomp
    if station_exist?(f_station) && station_exist?(l_station)
      @routs_collection << Route.new(get_station(f_station), get_station(l_station))
      puts 'route created!'
    else
      puts 'you should create stations first!'
    end
  end

  def assign_route
    puts 'enter train number'
    train_number = gets.chomp.to_i
    puts 'enter first station'
    f_station = gets.chomp
    puts 'enter last station'
    l_station = gets.chomp
    if route_exist?(f_station, l_station)
      get_train(train_number).set_route(get_route(f_station, l_station))
    else
      puts 'route don\'t exist'
    end
  end
  
  def add_carriage
    puts 'enter train number'
    train_number = gets.chomp
    if train_exist?(train_number)
      make_carriages
      p get_train(train_number)
      p @carriage
      get_train(train_number).attach_carriage(@carriage)
    else
      puts 'you should create train first'
    end
  end

  def remove_carriage
    puts 'enter train number'
    train_number = gets.chomp.to_i
    if train_exist?(train_number)
      @carriage = get_train(train_number).carriages.last
      get_train(train_number).detach_carriage(@carriage)
    else
      puts 'you should create train first'
    end
  end

  def move_forward
    puts 'enter train number'
    train_number = gets.chomp.to_i
    if train_exist?(train_number)
      get_train(train_number).go_forward
    else
      puts 'you should create train first'
    end
  end
  
  def move_backward
    puts 'enter train number'
    train_number = gets.chomp.to_i
    if train_exist?(train_number)
      get_train(train_number).go_backward
    else
      puts 'you should create train first'
    end
  end

  def see_stations
    @stations_collection.each { |station| puts "station: #{station.name}" }
  end

  def see_trains_on_station
    puts 'enter station name'
    station = gets.chomp
    get_station(station).trains.each { |train| puts "train number #{train.number} #{train.type} with #{train.carriages.length} carriages"}
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

  def make_carriages
    puts 'enter 1 for make passenger carriage and 2 for cargo cargo carriage'
    input = gets.chomp.to_i
    if input == 1
      @carriage = PassengerCarriage.new
    elsif input == 2
      @carriage = CargoCarriage.new
    else
      puts 'you should enter 1 or 2'   
    end
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
end


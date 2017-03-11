require_relative './train.rb'
require_relative './station.rb'

class Station
  attr_reader :station_name
  def initialize(station_name)
    @station_name = station_name
    @list_train = []
  end
  def list_train
    format(@list_train)
  end
  def send_train(train)
    @list_train.delete(train)
    puts "Train #{train} departed"
  end
  def get_train(train)
    @list_train << train
    puts "Train #{train} arrived"
  end
  def list_train_by_type
    pass_trains = @list_train.find_all { |x| x.type == 'pass' }
    puts "Passenger trains: #{format(pass_trains)}"
    freight_trains = @list_train.find_all { |x| x.type == 'freight' }
    puts "Freight trains: #{format(freight_trains)}"
  end
  def format(x)
    x.each { |x| puts "train number#{x.number}, type -  #{x.type}" }
  end
end

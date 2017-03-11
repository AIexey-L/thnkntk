require_relative './train.rb'
require_relative './station.rb'

class Station
  attr_reader :station_name
  def initialize(station_name)
    @station_name = station_name
    @list_train = []
  end
  def list_train
    @list_train
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
  end
end

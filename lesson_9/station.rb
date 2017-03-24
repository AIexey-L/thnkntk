require_relative 'validation'

class Station
  attr_reader :name, :trains

  include Validation::InstanceMethods
  extend Validation::ClassMethods
  
  @@all = []

  STATION_NAME_FORMAT = /^[a-z]{3,15}-?[a-z]{2,5}-?[a-z]{3,15}/i

  validate :name, :presence
  validate :name, :format, STATION_NAME_FORMAT

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all << self
  end

  def self.all
    @@all
  end

  def send_train(train)
    @trains.delete(train)
    puts "Train #{train.number} #{train.type} departed from #{name}"
  end

  def recieve_train(train)
    @trains << train
    puts "Train #{train.number} #{train.type} arrived to #{name}"
  end

  def trains_by_type(type)
    @trains.find_all { |train| train.type == type }
  end

  def station_valid?
    validate!
  rescue
    false
  end

  def each_train
    trains.each { |train| yield(train) }
  end
end

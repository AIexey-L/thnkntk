class Station
  attr_reader :name, :trains

  @@all = []

  STATION_NAME_FORMAT = /[a-z]{3,}\s*-*\s*/i

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
    validate!
  end

  def self.all
    @@all
  end

  def send_train(train)
    @trains.delete(train)
    puts "Train #{train.number} #{train.type} departed from #{self.name}"
  end
  
  def set_train(train)
    @trains << train
    puts "Train #{train.number} #{train.type} arrived to #{self.name}"
  end
  
  def trains_by_type(type)
    @trains.find_all { |train| train.type == type }
  end

  def station_valid?
    validate!
  rescue
    false
  end
  
  private

  def validate!
    raise 'Sation name is not valid' if name !~ STATION_NAME_FORMAT
    raise 'Station name too long' if name.length > 15
    raise 'Station name should not be nil' if name.nil?
    true
  end
  
end

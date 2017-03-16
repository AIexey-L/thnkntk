class Station
  attr_reader :name, :trains

  @@all = []
  
  def initialize(name)
    @name = name
    @trains = []
    @@all << self
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
  
end

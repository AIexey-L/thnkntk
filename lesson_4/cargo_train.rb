require_relative 'main'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'


class CargoTrain < Train
  
  def attach_carriage(carriage)
    super if carriage.is_a?(CargoCarriage)
  end
    
end

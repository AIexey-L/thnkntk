require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './cargo_carriage.rb'


class CargoTrain < Train
  
  def attach_carriage(carriage)
    super if carriage.is_a?(CargoCarriage)
  end
    
end

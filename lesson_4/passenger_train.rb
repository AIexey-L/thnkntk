require_relative './train.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './passenger_carriage.rb'

class PassengerTrain < Train
    
  def attach_carriage(carriage)
    super if carriage.is_a?(PassengerCarriage)
  end

end

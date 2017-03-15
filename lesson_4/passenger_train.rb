class PassengerTrain < Train
    
  def attach_carriage(carriage)
    super if carriage.is_a?(PassengerCarriage)
  end

end

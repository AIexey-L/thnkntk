require_relative 'validation'

class CargoTrain < Train

  validate :number, :format, VALID_TRAIN_NUMBER
end

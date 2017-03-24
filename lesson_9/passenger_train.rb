require_relative 'train'
require_relative 'validation'

class PassengerTrain < Train

  validate :number, :format, VALID_TRAIN_NUMBER
end

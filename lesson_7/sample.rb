require_relative 'station'
require_relative 'train'

station1 = Station.new('Bologoe')
p station1

5.times do |x|
  station1.set_train(Train.new("1212#{x}"))
end

p station1

station1.station_block_method { |train| puts train }

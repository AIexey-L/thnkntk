require_relative 'main'
require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_carriage'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'passenger_train'

stations_collection = []
trains_collection = []
routs_collection = []

loop do
  puts 'press number:'
  puts ' 1 - make station'
  puts ' 2 - make train'
  puts ' 3 - make route'
  puts ' 4 - assighn route to train'
  puts ' 5 - attach carriage to train'
  puts ' 6 - detach carriage to train'
  puts ' 7 - move train'
  puts ' 8 - show all stations'
  puts ' 9 - show trains on station'
  puts ' 0 - exit'
  input = gets.chomp.to_i
  break if input.zero?

  if input == 1
    puts 'enter name of station'
    input = gets.chomp
    stations_collection << (input.downcase = Station.new(input))
    puts "station #{station} created!"
    p stations_collection
  end

  if input == 2
    puts 'enter 1 for passenger train'
    puts 'enter 2 for cargo train'
    input = gets.chomp
    if input == 1
      puts 'enter number of train'
      input = gets.chomp
      input.to_s = PassengerTrain.new(input)
    end
  end
end

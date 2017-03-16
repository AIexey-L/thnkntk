require_relative 'main'

app = Application.new

loop do
  puts "enter number:\n1 - make_station"
  puts "2 - make_train\n3 - make_route"
  puts "4 - assing route to train\n5 - add carriage to train"
  puts "6 - remove carriage from train\n7 - move train forward"
  puts "8 - move train backward\n9 - see all stations"
  puts "10 - see train on station\n11 - exit"
  input = gets.chomp.to_i
  break if input == 11
  case input
  when 1
    puts 'making station'
    app.make_station
  when 2
    app.make_train
  when 3
    app.make_route
  when 4
    app.assign_route
  when 5
    app.add_carriage
  when 6
    app.remove_carriage
  when 7
    app.move_forward
  when 8
    app.move_backward
  when 9
    app.see_stations
  when 10
    app.see_trains_on_station
  end
end

require_relative 'main'

class Menu
  
  app = Application.new

  loop do
    puts "\n---------- MENU ----------\n\nenter number:\n\n1 - make_station"
    puts "2 - make_train\n3 - make_route"
    puts "4 - assing route to train\n5 - add carriage to train"
    puts "6 - remove carriage from train\n7 - move train forward"
    puts "8 - move train backward\n9 - see all stations"
    puts "10 - see train on station\n11 - exit\n"
    input = gets.chomp.to_i
    break if input == 11

    begin
      if input == 1
        puts '---------- making station ----------'
        puts 'enter name of station'
        input = gets.chomp
        app.make_station(input)
        puts "---------- station #{input} created! ----------"
      end
    rescue RuntimeError => e
      puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
      puts "\ntry again"
    end

    begin
    if input == 2
      puts '---------- making train ----------'
      puts 'enter 1 for passenger train and 2 for cargo train'
      input = gets.chomp.to_i
      if input == 1
        puts 'enter number of train'
        number = gets.chomp
        app.make_passenger_train(number)
        puts "\n---------- passenger train number #{number} created ----------"
      elsif input == 2
        puts 'enter number of train'
        number = gets.chomp
        app.make_cargo_train(number)
        puts "\n---------- cargo train number #{number} created ----------"
      end
    end
    rescue RuntimeError => e
      puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
      puts 'number format: XXXXX or XXX-XX'
      puts "\ntry again"
    end

    
    if input == 3
      
      app.make_route
    if input == 4
      app.assign_route
    if input == 5
      app.add_carriage
    if input == 6
      app.remove_carriage
    if input == 7
      app.move_forward
    if input == 8
      app.move_backward
    if input == 9
      app.see_stations
    if input == 10
      app.see_trains_on_station
    end

    def error_output(e)
      puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
      puts "\ntry again"
    end

  end
end

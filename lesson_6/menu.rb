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

    case input
    when 1
      begin
        puts '---------- making station ----------'
        puts 'enter name of station'
        input = gets.chomp
        app.make_station(input)
        puts "---------- station #{input} created! ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end

    when 2
      begin
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
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts 'number format: XXXXX or XXX-XX'
        puts "\ntry again"
      end
      
    when 3
      begin
        puts '---------- making route ----------'
        puts 'enter first station'
        f_station = gets.chomp
        puts 'enter last station'
        l_station = gets.chomp
        app.make_route(f_station, l_station)
        puts "---------- route #{f_station} #{l_station} created ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end
      
    when 4
      begin
        puts 'enter train number'
        train_number = gets.chomp.to_i
        puts 'enter first station'
        f_station = gets.chomp
        puts 'enter last station'
        l_station = gets.chomp
        app.assign_route(train_number, f_station, l_station)
        puts "---------- route #{f_station} #{l_station} assigned to train number #{train_number} ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end
      
    when 5
      puts '---------- making carriages first ----------'
      puts 'enter 1 for make passenger carriage and 2 for cargo cargo carriage'
      input = gets.chomp.to_i
      if input == 1
        app.make_passenger_carriage
        puts '---------- passenger carriage created ----------'
      elsif input == 2
        app.make_cargo_carriage
        puts '---------- cargo carriage created ----------'
      end
      
      begin
        puts '---------- attaching carriage ----------'
        puts 'enter train number'
        train_number = gets.chomp
        app.add_carriage(train_number)
        puts "---------- carriage attached to train number #{train_number} ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end

    when 6
      begin
        puts '---------- removing carriage ----------'
        puts 'enter train number'
        train_number = gets.chomp
        app.remove_carriage(train_number)
        puts "---------- carriage removed from train number #{train_number} ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end
      
    when 7
      begin
        puts '---------- moving train forward ----------'
        puts 'enter train number'
        train_number = gets.chomp
        app.move_forward(train_number)
        puts "---------- train number #{train_number} moved forward ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end
      
    when 8
      begin
        puts '---------- moving train backward ----------'
        puts 'enter train number'
        train_number = gets.chomp
        app.move_backward(train_number)
        puts "---------- train number #{train_number} moved backward ----------"
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end
      
    when 9
      puts '---------- stations ----------'
      app.see_stations
      
    when 10
      begin
        puts '---------- trains on station ----------'
        puts 'enter station name'
        station = gets.chomp
        app.see_trains_on_station(station)
      rescue RuntimeError => e
        puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
        puts "\ntry again"
      end
    end
  end
end

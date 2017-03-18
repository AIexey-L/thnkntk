require_relative 'main'

  app = Application.new

  def error_handler(e)
    puts "!!!!!!!!!! ERROR : #{e.message} !!!!!!!!!!"
    puts "\ntry again"
  end

  def enter_train_number
    puts 'enter train number'
    @train_number = gets.chomp
  end

  def enter_name_of_station
    puts 'enter name of station'
    @station = gets.chomp
  end

  def enter_two_stations
    puts 'enter first station'
    @f_station = gets.chomp
    puts 'enter last station'
    @l_station = gets.chomp
  end
  
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
        enter_name_of_station
        app.make_station(@station)
        puts "---------- station #{@station} created! ----------"
      rescue RuntimeError => e
        error_handler(e)
      end

    when 2
      begin
        puts '---------- making train ----------'
        puts 'enter 1 for passenger train and 2 for cargo train'
        input = gets.chomp.to_i
        if input == 1
          enter_train_number
          app.make_passenger_train(@number)
          puts "\n---------- passenger train number #{@number} created ----------"
        elsif input == 2
          enter_train_number
          app.make_cargo_train(@number)
          puts "\n---------- cargo train number #{@number} created ----------"
        end
      rescue RuntimeError => e
        error_handler(e)
      end
      
    when 3
      begin
        puts '---------- making route ----------'
        enter_two_stations
        app.make_route(@f_station, @l_station)
        puts "---------- route #{@f_station} #{@l_station} created ----------"
      rescue RuntimeError => e
        error_handler(e)
      end
      
    when 4
      begin
        enter_train_number
        enter_two_stations
        app.assign_route(@train_number, @f_station, @l_station)
        puts "---------- route #{@f_station} #{@l_station} assigned to train number #{@train_number} ----------"
      rescue RuntimeError => e
        error_handler(e)
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
        enter_train_number
        app.add_carriage(@train_number)
        puts "---------- carriage attached to train number #{@train_number} ----------"
      rescue RuntimeError => e
        error_handler(e)
      end

    when 6
      begin
        puts '---------- removing carriage ----------'
        enter_train_number
        app.remove_carriage(@train_number)
        puts "---------- carriage removed from train number #{@train_number} ----------"
      rescue RuntimeError => e
        error_handler(e)
      end
      
    when 7
      begin
        puts '---------- moving train forward ----------'
        enter_train_number
        app.move_forward(@train_number)
        puts "---------- train number #{@train_number} moved forward ----------"
      rescue RuntimeError => e
        error_handler(e)
      end
      
    when 8
      begin
        puts '---------- moving train backward ----------'
        enter_train_number
        app.move_backward(@train_number)
        puts "---------- train number #{@train_number} moved backward ----------"
      rescue RuntimeError => e
        error_handler(e)
      end
      
    when 9
      puts '---------- stations ----------'
      app.see_stations
      
    when 10
      begin
        puts '---------- trains on station ----------'
        enter_name_of_station
        app.see_trains_on_station(@station)
      rescue RuntimeError => e
        error_handler(e)
      end
      
    end
    
  end

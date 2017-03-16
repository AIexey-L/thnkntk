module Manufacturer

  def set_manufacturer
    puts 'enter manufacturer name'
    manufacturer = gets.chomp
    @manufacturer = manufacturer
  end

  def get_manufacturer
    @manufacturer
  end
  
end

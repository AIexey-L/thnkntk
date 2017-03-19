require_relative = 'manufacturer'

class PassengerCarriage

  include Manufacturer

  attr_reader :seats_taken, :free_seats
  
  def initialize(seats)
    @seats = seats.to_i
    @free_seats = @seats
    @seats_taken = 0
  end

  def take_seat
    @free_seats = @free_seats - 1 if seats_remain?
    @seats_taken = @seats - @free_seats
  end
  
  private
  
  def seats_remain?
    raise 'No seats remain' if @free_seats.zero?
    true
  end
  
end

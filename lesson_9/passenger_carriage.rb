require_relative 'manufacturer'

class PassengerCarriage
  include Manufacturer

  attr_reader :free_seats

  def initialize(seats)
    @seats = seats.to_i
    @free_seats = @seats
  end

  def seats_taken
    @seats - @free_seats
  end

  def take_seat
    @free_seats -= 1 if seats_remain?
  end

  private

  def seats_remain?
    raise 'No seats remain' if @free_seats.zero?
    true
  end
end

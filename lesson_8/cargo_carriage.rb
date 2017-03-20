
class CargoCarriage
  include Manufacturer

  attr_reader :free_volume

  def initialize(total_volume)
    @total_volume = total_volume.to_f
    @free_volume = @total_volume
  end

  def take_volume(take_volume)
    @free_volume -= take_volume if valid_take_volume?(take_volume)
  end

  def volume_occupeid
    @total_volume - @free_volume
  end

  private

  def valid_take_volume?(take_volume)
    raise 'Not enough volume in carriage' if @free_volume - take_volume < 0
    true
  end
end

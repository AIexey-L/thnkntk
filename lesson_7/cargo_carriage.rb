require_relative = 'manufacturer'

class CargoCarriage

  include Manufacturer

  attr_reader :free_volume, :volume_occupeid
  
  def initialize(total_volume)
    @total_volume = total_volume.to_f
    @volume_occupeid = 0
    @free_volume = @total_volume
  end
  
  def take_volume(volume_to_take)
    @free_volume = @free_volume - volume_to_take if valid_volume_to_take?(volume_to_take)
    @volume_occupeid = @total_volume - @free_volume
  end
    
  private

  def valid_volume_to_take?(volume_to_take)
    raise 'Not enough volume remain in carriage' if @free_volume - volume_to_take < 0
    true
  end
  
end

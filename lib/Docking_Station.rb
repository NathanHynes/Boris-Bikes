require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    if @bike.nil?
      raise "No Bike Stored"
    else
      @bike
    end
  end

  def dock(bike)
    puts "bike docked"
    @bike = bike
  end
end

require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    @bike.nil? ? (raise "No Bike Stored") : (@bike)
  end

  def dock(bike)
    puts "bike docked"
    @bike = bike
  end
end

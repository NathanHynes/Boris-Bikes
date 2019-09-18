require_relative 'bike'

# creates DockingStation class
class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise 'No Bike Stored' if @docked_bikes.empty?

    @docked_bikes.pop
  end

  def dock(bike)
    raise 'No more space' if @docked_bikes.length >= 20

    @docked_bikes << bike
  end
end

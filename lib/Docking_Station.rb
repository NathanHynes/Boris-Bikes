require_relative 'bike'

# creates DockingStation class
class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise 'No Bike Stored' if empty?

    @docked_bikes.pop
  end

  def dock(bike)
    raise 'No more space' if full?

    @docked_bikes << bike
  end

  private

  def full?
    true if @docked_bikes.length >= 20
  end

  def empty?
    @docked_bikes.empty?
  end
end

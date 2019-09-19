require_relative 'bike'

# creates DockingStation class
class DockingStation
  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20

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
    true if @docked_bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end
end

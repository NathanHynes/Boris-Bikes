require_relative 'bike'

# creates DockingStation class
class DockingStation
  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No Bike Stored' if empty?

    # Iterates through the docked bikes and will return working bikes.
    @docked_bikes.each do |bike|
      return @docked_bikes.delete(bike) if bike.working?
    end
    # If no working bikes found below error is raised
    raise 'No working Bike Stored'
  end

  def dock(bike)
    raise 'No more space' if full?

    @docked_bikes << bike
  end

  def broken_bikes
    @docked_bikes.map do |bike|
      @docked_bikes.delete(bike) unless bike.working?
    end
  end

  private

  def full?
    true if @docked_bikes.length >= @capacity
  end

  def empty?
    @docked_bikes.empty?
  end
end

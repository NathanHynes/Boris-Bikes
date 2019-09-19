require_relative 'bike'

# creates DockingStation class
class DockingStation
  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20

  # upon setting up new class you can assign it a capacity.
  # if you don't assign it a capacity it assigns DEFAULT_CAPACITY.
  def initialize(capacity = DEFAULT_CAPACITY)
    # sets up an array to store bikes
    @docked_bikes = []
    # sets up capacity variable.
    @capacity = capacity
  end

  def release_bike
    # If DockingStation is empty below error is raised.
    raise 'No Bike Stored' if empty?

    # Iterates through the docked bikes and will return working bikes.
    @docked_bikes.each do |bike|
      return @docked_bikes.delete(bike) if bike.working?
    end
    # If no working bikes found below error is raised.
    raise 'No working Bike Stored'
  end

  def dock(bike)
    # If DockingStation is at full capacity below error is raised.
    raise 'No more space' if full?

    # otherwise bike can be added to DockingStation/
    @docked_bikes << bike
  end

  # This Method is a work in progress
  def broken_bikes
    @docked_bikes.map do |bike|
      @docked_bikes.delete(bike) unless bike.working?
    end
  end

  # Can only be called inside Class it is not public outside of Class.
  private

  def full?
    # It will only return true if DockingStation is at full capacity.
    true if @docked_bikes.length >= @capacity
  end

  def empty?
    # It will only return true if DockingStation is empty.
    @docked_bikes.empty?
  end
end

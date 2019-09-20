require_relative 'garage'

class Van

  def initialize

  end
  def collect(dockingstation)
    @storage = dockingstation.docked_bikes.select { |bike| !bike.working? }
  end

  def deliver(garage)
    @storage.each do |bike|
      garage.inventory << bike
    end
  end
end

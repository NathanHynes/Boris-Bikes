require_relative 'garage'

class Van
  attr_reader :storage

  def initialize

  end
  def collect(dockingstation)
    @storage = dockingstation.docked_bikes.select { |bike| !bike.working? }
  end

  def deliver(garage)
    @storage.each do |bike|
      garage.inventory << @storage.delete(bike)
    end
  end
end

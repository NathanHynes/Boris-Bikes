class Van

  def initialize

  end
  def collect(dockingstation)
    @storage = dockingstation.docked_bikes.select { |bike| !bike.working? }
  end
end

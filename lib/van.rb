class Van

def initialize
  @broken_bikes = []
end
  def collect(dockingstation)
    dockingstation.broken_bikes.each do |bike|
      @broken_bikes << bike
    end
  end
end

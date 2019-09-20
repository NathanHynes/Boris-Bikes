class Bike
  attr_accessor :broken
  def working?
    # This value below doesn't exist until initialised. Therefore the opposite
    # of nil is true. Once value has been set as true, this will be false.
    !@broken
  end

  def report_broken
    @broken = true
  end
end

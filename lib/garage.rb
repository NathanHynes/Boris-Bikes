require_relative 'bike'
class Garage
  attr_accessor :inventory

  def initialize
    @inventory = []
  end

  def fix
    inventory.each do |bike|
      bike.broken = false
    end
  end

  def loadup(van)
    @inventory.each do |bike|
      van.storage.push(@inventory.delete(bike))
    end
  end
end

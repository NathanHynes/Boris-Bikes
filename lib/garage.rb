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

end

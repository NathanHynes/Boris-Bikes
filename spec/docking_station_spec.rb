require 'Docking_Station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { expect(DockingStation.new.release_bike.class).to eq Bike }
  it {expect(DockingStation.new.release_bike).to respond_to (:working?)}
end

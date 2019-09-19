require 'Docking_Station'

describe DockingStation do

  describe '#initialize' do
    it 'can be initialized with a capacity' do
      # expect(DockingStation).to receive(:new).with(1)
      # DockingStation.new(1)
      expect(DockingStation.new(20))
    end
  end

  describe '#release_bike' do
    # Test whether subject responds to release_bike method
    it { expect(DockingStation.new).to respond_to(:release_bike) }

    # Test whether release_bike creates a Bike Class
    it 'creates a class of Bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike.class).to eq Bike
    end

    # Test whether the Bike release_bike creates, responds to working? method
    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    # Test whether an error message is raised if there is no bikes.
    it 'returns error message if there are no bikes' do
      expect { subject.release_bike }.to raise_error('No Bike Stored')
    end
  end

  describe '#dock' do
    # Test to make sure DockingStation Class responds to Dock with 1 argument
    it { is_expected.to respond_to(:dock).with(1).argument }

    # Test to make sure docked bike returns Bike
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bikes[0]).to eq bike
    end

    it 'has a default capacity limit' do
      # Fill the Station
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(Bike.new)
      end
      # Add one more bike
      expect { subject.dock(Bike.new) }.to raise_error 'No more space'
    end
    it 'can have a specified limit' do
      subject = DockingStation.new(30)
      # Fill the Station
      30.times do
        subject.dock(Bike.new)
      end
      # Add one more bike
      expect { subject.dock(Bike.new) }.to raise_error 'No more space'
    end
  end
end

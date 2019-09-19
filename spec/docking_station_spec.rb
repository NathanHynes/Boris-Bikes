require 'Docking_Station'

describe DockingStation do
  let(:bike) { double('bike') }
  describe '#initialize' do
    it 'can be initialized with a capacity' do
      expect(DockingStation.new(20))
    end
  end

  describe '#release_bike' do
    # Test whether subject responds to release_bike method
    it { expect(DockingStation.new).to respond_to(:release_bike) }

    # Test whether release_bike creates a Bike Class
    it 'creates a class of Bike' do
      allow(bike).to receive(:working?) { true }
      allow(bike).to receive(:class).and_return(Bike)
      subject.dock(bike)
      expect(subject.release_bike.class).to eq Bike
    end

    # Test whether the Bike release_bike creates, responds to working? method
    it 'releases a working bike' do
      allow(bike).to receive(:working?) { true }
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    # Test whether an error message is raised if there is no bikes.
    it 'returns error message if there are no bikes' do
      expect { subject.release_bike }.to raise_error('No Bike Stored')
    end

    it 'doesnt release broken bikes' do
      allow(bike).to receive(:report_broken) { true }
      bike.report_broken
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('No working Bike Stored')
    end

    it 'removes bikes from stored_bikes when they are released' do
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(true)
      subject.release_bike
      expect(subject.docked_bikes.length).to eq 0
    end
  end

  describe '#dock' do
    # Test to make sure DockingStation Class responds to Dock with 1 argument
    it { is_expected.to respond_to(:dock).with(1).argument }

    # Test to make sure docked bike returns Bike
    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.docked_bikes[0]).to eq bike
    end

    it 'has a default capacity limit' do
      # Fill the Station
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      # Add one more bike
      expect { subject.dock(bike) }.to raise_error 'No more space'
    end
    it 'can have a specified limit' do
      subject = DockingStation.new(30)
      # Fill the Station
      30.times do
        subject.dock(bike)
      end
      # Add one more bike
      expect { subject.dock(bike) }.to raise_error 'No more space'
    end

    it 'docks broken bikes' do
      allow(bike).to receive(:report_broken) { true }
      bike.report_broken
      subject.dock(bike)
      expect(subject.docked_bikes[0]).to eq bike
    end
  end

  describe '# broken_bikes' do
    it 'release broken bikes' do
      allow(bike).to receive(:report_broken) { true }
      allow(bike).to receive(:working?) { false }
      bike.report_broken
      subject.dock(bike)
      expect(subject.broken_bikes).to eq [bike]
    end
  end
end

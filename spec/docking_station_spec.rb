require 'Docking_Station'

describe DockingStation do

  describe '#release_bike' do
    # Test whether subject responds to release_bike method
    it { expect(DockingStation.new).to respond_to(:release_bike) }

    # Test whether release_bike creates a Bike Class
    it 'creates a class of Bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike.class).to eq Bike
    end

    #Test whether the Bike release_bike creates, responds to working? method defined in Bike Class
    it 'creates a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    #Test whether an error message is raised if there is no bikes.
    it "returns error message if there are no bikes" do
      expect { subject.release_bike }.to raise_error("No Bike Stored")
    end
  end

  describe '#dock' do
    #Test to make sure DockingStation Class responds to Dock with 1 argument
    it { is_expected.to respond_to(:dock).with(1).argument}

    #Test to make sure docked bike returns Bike
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end
  end
end

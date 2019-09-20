require 'van'
require 'docking_station'

describe Van do
  let(:bike) { double :bike, report_broken: true, working?: false }
  let(:ds) { DockingStation.new }
  # let(:ds) { double :DockingStation }
  let(:van) { subject }

  describe '#collect_bikes' do
    it 'collects broken bikes from docking stations' do
      # allow(ds).to receive(:dock).with(1).argument { @docked_bikes = [bike] }
      bike.report_broken
      ds.dock bike
      expect(subject.collect(ds)).to eq [bike]

      # expect(subject).to receive(:collect).with(ds).and_return([bike])
    end
  end

  describe '#deliver' do
    it 'delivers broken bikes to a user specified garage' do
      bike.report_broken
      ds.dock bike
      subject.collect(ds)
      garage = Garage.new
      subject.deliver(garage)
      expect(garage.inventory).to eq [bike]
    end
  end
  # what happens when there are no broken bikes to collect?
  describe '#distribute' do
    it 'distributes working bikes to a docking station' do
      ds = DockingStation.new
      subject.storage = [bike]
      subject.distribute(ds)
      expect(ds.docked_bikes).to eq [bike]
    end
  end
end

require 'van'

describe Van do
  describe '#collect_bikes' do
    it 'collects broken bikes from docking stations' do
      ds = DockingStation.new
      bike = Bike.new
      bike.report_broken
      ds.dock(bike)
      expect(subject.collect(ds)).to eq [bike]
    end
  end
end

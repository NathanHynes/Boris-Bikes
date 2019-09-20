require 'garage'
require 'bike'

describe Garage do
  # let(:bike) { double :bike, report_broken: true, broken: true, working?: false }
  describe '#fix' do
    it 'turns broken bikes into working bikes' do
      bike = Bike.new
      bike.report_broken
      subject.inventory = [bike]
      subject.fix
      # allow(bike).to receive(report_broken) {false}
      # allow(bike).to receive(broken) { false }
      expect(bike.broken).to eq false
    end

    it 'returns working bikes' do
      expect(subject.fix).to eq subject.inventory
    end

    it 'loads up working bikes to a user specified van' do
      bike = Bike.new
      van = Van.new
      bike.report_broken
      subject.inventory = [bike]
      subject.fix
      subject.loadup(van)
      expect(van.storage).to eq [bike]
    end
  end
end

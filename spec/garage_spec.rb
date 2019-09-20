require 'garage'
require 'bike'

describe Garage do
  let(:bike) { double :bike, report_broken: true, working?: false }
  describe '#fix' do
    it 'fixes bikes' do
      subject.inventory = [bike]
      subject.fix
      expect(bike.working?).to eq true
    end
  end
end

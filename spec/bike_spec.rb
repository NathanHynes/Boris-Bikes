require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  describe '#report_broken' do
    it 'returns true' do
      expect(subject.report_broken).to eq(true)
    end
  end
end

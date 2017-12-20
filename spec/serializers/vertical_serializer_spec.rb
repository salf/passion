RSpec.describe VerticalSerializer, type: :serializer do
  let(:vertical)   { build_stubbed(:vertical) }
  let(:serializer) { described_class.new(vertical) }

  subject { JSON.parse(serializer.to_json) }

  let(:expected_attributes) do
    %w(id name)
  end

  it 'includes in serialized object' do
    expect(subject.keys).to match_array(expected_attributes)
  end
end

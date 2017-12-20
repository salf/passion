RSpec.describe CategorySerializer, type: :serializer do
  let(:category)   { build_stubbed(:category) }
  let(:serializer) { described_class.new(category) }

  subject { JSON.parse(serializer.to_json) }

  let(:expected_attributes) do
    %w(id name verticals state)
  end

  it 'includes in serialized object' do
    expect(subject.keys).to match_array(expected_attributes)
    expect(subject['verticals']).to eq(category.vertical_id)
  end
end

# == Schema Information
#
# Table name: verticals
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

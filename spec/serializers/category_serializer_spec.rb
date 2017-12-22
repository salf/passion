# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  state       :string           default("disabled"), not null
#  vertical_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_vertical_id  (vertical_id)
#
# Foreign Keys
#
#  fk_rails_...  (vertical_id => verticals.id)
#

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

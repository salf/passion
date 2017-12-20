RSpec.describe CourseSerializer, type: :serializer do
  let(:course)   { build_stubbed(:course) }
  let(:serializer) { described_class.new(course) }

  subject { JSON.parse(serializer.to_json) }

  let(:expected_attributes) do
    %w(id name author state categories)
  end

  it 'includes in serialized object' do
    expect(subject.keys).to match_array(expected_attributes)
    expect(subject['categories']).to eq(course.category_id)
  end
end

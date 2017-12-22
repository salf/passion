# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  author      :string           not null
#  category_id :integer
#  state       :string(20)       default("disabled"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_courses_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

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

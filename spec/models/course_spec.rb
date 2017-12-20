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

RSpec.describe Course, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to validate_inclusion_of(:state).in_array(described_class::TYPES) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:category) }
end

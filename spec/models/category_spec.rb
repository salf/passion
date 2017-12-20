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

RSpec.describe Category, type: :model do
  it { is_expected.to belong_to(:vertical) }
  it { is_expected.to validate_inclusion_of(:state).in_array(described_class::TYPES) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:vertical) }
end

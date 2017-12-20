# == Schema Information
#
# Table name: verticals
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Vertical, type: :model do
  it { is_expected.to have_many(:categories) }
  it { is_expected.to validate_presence_of(:name) }
end

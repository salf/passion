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

FactoryBot.define do
  factory :category do
    name     { Faker::Lorem.word }
    state    { ['active', 'disabled'].sample }
    association :vertical, factory: :vertical
  end
end

# == Schema Information
#
# Table name: verticals
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :vertical do
    name { Faker::Lorem.word }
  end
end

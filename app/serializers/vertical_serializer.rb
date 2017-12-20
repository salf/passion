# == Schema Information
#
# Table name: verticals
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VerticalSerializer < ActiveModel::Serializer
  attributes :id, :name
end

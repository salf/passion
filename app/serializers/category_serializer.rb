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

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :verticals, :state

  def verticals
    object.vertical_id
  end
end

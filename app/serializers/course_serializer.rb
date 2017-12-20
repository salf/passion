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

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :author, :state, :categories

  def categories
    object.category_id
  end
end

# == Schema Information
#
# Table name: verticals
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vertical < ApplicationRecord
  has_many :categories

  validates :name, presence: true
end

# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string           not null
#  uid              :string           not null
#  email            :string           not null
#  name             :string
#  oauth_token      :string
#  access_token     :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.access_token     = BCrypt::Password.create(auth.credentials.token)
      user.save!
    end
  end
end

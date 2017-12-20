module States
  extend ActiveSupport::Concern

  TYPES = %w(active disabled).freeze

  included do
    validates :state, inclusion: TYPES
  end
end

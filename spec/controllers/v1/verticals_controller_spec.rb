require_relative '../concerns/resource_actions.rb'

RSpec.describe V1::VerticalsController, type: :controller do
  it_behaves_like 'resource actions', :vertical
end

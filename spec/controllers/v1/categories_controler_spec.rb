require_relative '../concerns/resource_actions.rb'

RSpec.describe V1::CategoriesController, type: :controller do
  it_behaves_like 'resource actions', :category
end

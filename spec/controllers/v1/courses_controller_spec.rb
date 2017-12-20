require_relative '../concerns/resource_actions.rb'

RSpec.describe V1::CoursesController, type: :controller do
  it_behaves_like 'resource actions', :course
end

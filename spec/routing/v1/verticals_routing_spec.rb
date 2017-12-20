RSpec.describe V1::VerticalsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/verticals').to route_to('v1/verticals#index')
    end

    it 'routes to #show' do
      expect(get: '/v1/verticals/1').to route_to('v1/verticals#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/verticals').to route_to('v1/verticals#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/verticals/1').to route_to('v1/verticals#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/verticals/1').to route_to('v1/verticals#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/verticals/1').to route_to('v1/verticals#destroy', id: '1')
    end
  end
end

require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: 'venues/1/reviews/new').to route_to(
        'reviews#new', venue_id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'venues/1/reviews/1/edit').to route_to(
        'reviews#edit', venue_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'venues/1/reviews').to route_to(
        'reviews#create', venue_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'venues/1/reviews/1').to route_to(
        'reviews#update', venue_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'venues/1/reviews/1').to route_to(
        'reviews#update', venue_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'venues/1/reviews/1').to route_to(
        'reviews#destroy', venue_id: '1', id: '1')
    end
  end
end

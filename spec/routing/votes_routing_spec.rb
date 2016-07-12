require 'rails_helper'

RSpec.describe VotesController, type: :routing do
  describe 'routing' do
    it 'routes to #create_upvote' do
      expect(post: 'venues/1/reviews/1/upvote').to route_to(
        'votes#create_upvote', venue_id: '1', review_id: '1')
    end
    it 'routes to #create_downvote' do
      expect(post: 'venues/1/reviews/1/downvote').to route_to(
        'votes#create_downvote', venue_id: '1', review_id: '1')
    end
  end
end

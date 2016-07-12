require 'rails_helper'

RSpec.describe VotesController, type: :routing do
  describe 'routing' do
    it 'routes to #upvote' do
      expect(post: 'venues/1/reviews/1/upvote').to route_to(
        'votes#upvote', venue_id: '1', review_id: '1')
    end
  end
end

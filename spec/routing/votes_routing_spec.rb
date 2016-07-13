require 'rails_helper'

RSpec.describe VotesController, type: :routing do
  describe 'routing' do
    it 'routes to #upvote' do
      expect(post: 'reviews/1/votes').to route_to(
        'votes#create', review_id: '1')
    end
  end
end

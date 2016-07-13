require 'rails_helper'

describe Vote do
  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:review_id).when(1) }
  it { should_not have_valid(:review_id).when(nil, '') }

  it { should have_valid(:value).when(1, -1, 0) }
  it { should_not have_valid(:value).when(nil, 3, '') }
end

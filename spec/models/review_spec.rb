require 'rails_helper'

describe Review do
  it { should have_valid(:venue_id).when(2) }
  it { should_not have_valid(:venue_id).when(nil, '') }

  it { should have_valid(:user_id).when(6) }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:rating).when(9) }
  it { should_not have_valid(:rating).when(1000) }

  it { should have_valid(:sum_votes).when(8) }
  it { should_not have_valid(:sum_votes).when(nil, '') }
end

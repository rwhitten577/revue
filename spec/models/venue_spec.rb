require 'rails_helper'

describe Venue do
  it { should have_valid(:name).when('a name') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:street).when('123 Street') }
  it { should_not have_valid(:street).when(nil, '') }

  it { should have_valid(:city).when('Boston') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:category).when('Music') }
  it { should_not have_valid(:category).when(nil, '') }
end

require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      username: 'xxxxx',
      email: 'flvbliv',
      encrypted_password: 'jfoeiej',
      admin: false
            )
  end

  it { is_expected.to have_valid(:username).when('boringusername') }
  it { is_expected.to_not have_valid(:username).when(nil, '') }
  it { expect(user).to validate_uniqueness_of(:username) }

  it { is_expected.to have_valid(:email).when('boring@gmail.com') }
  it { is_expected.to_not have_valid(:email).when(nil, '') }
  it { expect(user).to validate_uniqueness_of(:email) }

  it { is_expected.to have_valid(:encrypted_password).when('123456') }
  it { is_expected.to_not have_valid(:encrypted_password).when(nil, '') }

  it { is_expected.to have_valid(:admin).when(false) }
  it { is_expected.to have_valid(:admin).when(true) }
  it { is_expected.to_not have_valid(:encrypted_password).when(nil, '') }
end

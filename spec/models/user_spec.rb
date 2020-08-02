require 'rails_helper'

describe User, type: :model do

  it 'is not valid unless it has a unique username' do
    User.create(
      username: 'Luni', email: 'luni@example.com',password: 'Password0')
    user = User.create(
      username: 'Luni', email: 'luni@test.com', password: 'Password1')
    expect(user).not_to be_valid
  end

  it 'is not valid without a username' do
    user = User.create(email: 'luni@example.com',password: 'Password0')
    expect(user).not_to be_valid
  end

  it 'is not valid without an email address' do
    user = User.create(username: 'Luni',password: 'Password0')
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = User.create(username: 'Luni', email: 'luni@example.com')
    expect(user).not_to be_valid
  end

end

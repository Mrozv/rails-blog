require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = FactoryBot.create(:user)
    puts user.inspect
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    puts user.inspect
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = FactoryBot.build(:user, last_name: nil)
    puts user.inspect
    expect(user).not_to be_valid
    expect(user.errors[:last_name]).to include("can't be blank")
  end
end

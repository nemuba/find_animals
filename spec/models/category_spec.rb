require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { create(:category, user_id: user.id) }
  
  it 'Description present' do
    should validate_presence_of(:description)
  end

  it 'User present' do
    should belong_to(:user)
  end
end

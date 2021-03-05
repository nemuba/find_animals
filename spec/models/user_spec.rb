require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  context 'Email present' do
    it { should validate_presence_of(:email) }
  end

  context 'Password present' do
    it { should validate_presence_of(:password) }
  end

  context 'Password Confirmation present' do
    it { should validate_presence_of(:password_confirmation) }
  end

  describe 'User valid' do
    subject { build(:user) }

    it 'User valid?' do
      expect(subject).to  be_valid
    end
  end

  describe 'User invalid' do
    subject { build(:user, email: nil, password: nil, password_confirmation: nil) }

    it 'User invalid?' do
      expect(subject).to_not  be_valid
    end
  end
  
end

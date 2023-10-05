require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:user_roles) }
    it { should have_many(:users).through(:user_roles) }
  end
end

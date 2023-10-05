require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { should have_many(:rents) }
  end
end

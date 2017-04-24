require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:project) { FactoryGirl.create(:project, name: "RandmName", user: user) }
  it { is_expected.to have_many(:issues) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_uniqueness_of(:name) }
end

require 'rails_helper'

RSpec.describe Issue, type: :model do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:project) { FactoryGirl.create(:project, name: "RandmName", user: user) }
  let!(:project1) { FactoryGirl.create(:project, name: "AnotherName", user: user) }
  let!(:issue) { FactoryGirl.create(:issue, user: user, project: project) }
  [:name, :body].each do |a|
    it { is_expected.to validate_presence_of(a) }
  end
  [:user, :project].each do |a|
    it { is_expected.to belong_to(a) }
  end
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:comments).dependent :destroy }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive.scoped_to(:project_id) }
end

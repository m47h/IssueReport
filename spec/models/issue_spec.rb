require 'rails_helper'

RSpec.describe Issue, type: :model do
  [:name, :body].each do |a|
    it { is_expected.to validate_presence_of(a) }
  end
  [:user, :project].each do |a|
    it { is_expected.to belong_to(a) }
  end
  it { is_expected.to have_many(:comments) }
  it { is_expected.to validate_uniqueness_of(:name) }
end

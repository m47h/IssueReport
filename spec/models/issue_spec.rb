require 'rails_helper'

RSpec.describe Issue, type: :model do
  [:name, :body, :image].each do |a|
    it { is_expected.to validate_presence_of(a) }
  end
  it { is_expected.to have_many(:comments) }
  it { is_expected.to validate_uniqueness_of(:name) }
end

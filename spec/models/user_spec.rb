require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to have_many(:projects) }
  it { is_expected.to have_many(:issues) }
  it { is_expected.to have_many(:comments) }
end

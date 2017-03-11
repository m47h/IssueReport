require 'rails_helper'

RSpec.feature 'Issue index', type: :feature do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:issue) { FactoryGirl.create(:issue) }

  scenario 'User logs in and display issues list' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    click_link 'Issues'

    expect(page).to have_content 'Listing issues'
  end
end

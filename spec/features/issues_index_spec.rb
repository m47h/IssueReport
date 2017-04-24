require 'rails_helper'

RSpec.feature 'Issue', type: :feature do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:project) { FactoryGirl.create(:project, user: user) }
  let!(:issue) { FactoryGirl.create(:issue, user: user, project: project) }
  let!(:issue2) { FactoryGirl.create(:issue, name: 'Name2', user: user, project: project) }
  before(:each) do
    login_as user
    visit project_path(project.id)
  end

  scenario 'Signs me in' do
    visit sign_out_path
    expect(page).to have_content 'You need to sign in or sign up before continuing. '
    visit new_user_session_path
    within('form#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content user.email
    expect(page).to have_content 'Projects'
  end

  scenario '#index : User logs in and display issues list' do
    click_link 'Issues'
    expect(page).to have_content issue.name
    expect(page).to have_content 'Name2'
  end

  scenario '#index : Search issue' do
    within('form.navbar-form') do
      fill_in 'Search', with: issue.name
      click_button 'Search'
    end
    expect(page).to have_content issue.name
    expect(page).not_to have_content 'Name2'
  end

  scenario '#create : remote CORRECT creating Issue', js: true do
    click_link 'New Issue'
    expect(page).to have_content 'Body'
    within('form#new_issue') do
      fill_in 'Name', with: 'myName1'
      fill_in 'Body', with: 'Body my twice'
      page.attach_file('issue_image', Rails.root.join('spec', 'support', '64x64.png'))
      click_button 'Issue'
    end
    expect(page).to have_content 'myName1'
    expect(page).to have_content user.email
  end

  scenario '#create : remote creating Issue with blank NAME', js: true do
    click_link 'New Issue'
    expect(page).to have_content 'Body'
    within('form#new_issue') do
      fill_in 'Name', with: ''
      click_button 'Issue'
    end
    expect(page).to have_content 'blank'
  end

  scenario '#update : remote CORRECT editing Issue', js: true do
    within('#issue_' + issue.id.to_s) do
      click_link 'Edit'
    end
    within('.edit_issue') do
      fill_in 'Name', with: issue2.name
      click_button 'Issue'
    end
    expect(page).to have_content 'has already been taken'
    within('.edit_issue') do
      fill_in 'Name', with: 'Correct Name'
      click_button 'Issue'
    end
    expect(page).to have_content 'Correct Name'
  end

  scenario '#destroy : remove issue from list' do
    within('#issue_' + issue.id.to_s) do
      click_link 'Destroy'
    end
    driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
    expect(page).not_to have_content issue.name
  end
end

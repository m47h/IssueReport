require 'rails_helper'

RSpec.feature 'Project', type: :feature do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:project) { FactoryGirl.create(:project, user: user) }
  let!(:project2) { FactoryGirl.create(:project, name: "RandomName", user: user) }
  let!(:issue) { FactoryGirl.create(:issue, name: 'RandomName1', user: user, project: project) }
  let!(:issue2) { FactoryGirl.create(:issue, name: 'RandomName2', user: user, project: project2) }
  let!(:issue3) { FactoryGirl.create(:issue, user: user, project: project2) }
  before(:each) do
    login_as user
    visit projects_path
  end

  scenario '#index : User logs in and display projects list' do
    click_link 'Projects'
    expect(page).to have_content project.name
    expect(page).to have_content 'RandomName'
  end

  scenario '#search IssueController: Search issue' do
    within('form.navbar-form') do
      fill_in 'Search', with: "andom"
      click_button 'Search'
    end
    expect(page).to have_content issue.name
    expect(page).to have_content issue2.name
  end

  scenario '#create : remote CORRECT creating Project', js: true do
    click_link 'New Project'
    expect(page).to have_content 'Name'
    within('form#new_project') do
      fill_in 'Name', with: 'myName1'
      click_button 'Project'
    end
    expect(page).to have_content 'myName1'
    expect(page).to have_content user.email
  end

  scenario '#create : remote creating Project with blank NAME', js: true do
    click_link 'New Project'
    expect(page).to have_content 'Name'
    within('form#new_project') do
      fill_in 'Name', with: ''
      click_button 'Project'
    end
    expect(page).to have_content 'blank'
  end

  scenario '#update : remote CORRECT editing Project', js: true do
    within('#project_' + project.id.to_s) do
      click_link 'Edit'
    end
    within('.edit_project') do
      fill_in 'Name', with: project2.name
      click_button 'Project'
    end
    expect(page).to have_content 'has already been taken'
    within('.edit_project') do
      fill_in 'Name', with: 'Correct Name'
      click_button 'Project'
    end
    expect(page).to have_content 'Correct Name'
  end

  scenario '#destroy : remove project from list', js: true do
    accept_confirm do
      within('#project_' + project.id.to_s) do
        click_link 'Destroy'
      end
    end
    expect(page).not_to have_content project.name
  end
end

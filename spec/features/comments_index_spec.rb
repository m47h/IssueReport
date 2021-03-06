require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:project) { FactoryGirl.create(:project, user: user) }
  let!(:issue) { FactoryGirl.create(:issue, user: user, project: project) }
  let!(:comment) { FactoryGirl.create(:comment, user: user, issue: issue) }
  before(:each) do
    login_as user
    visit issue_path(issue)
  end

  scenario '#index : display comments for Issue', js: true do
    expect(page).to have_content issue.name
    expect(page).to have_content comment.body
    expect(page).to have_content user.email
  end

  scenario '#create : create and display comment', js: true do
    body = Faker::Lorem.paragraph(2, true, 4)
    within('form#new_comment') do
      fill_in 'Body', with: body
      click_button 'Comment'
    end
    expect(page).to have_content issue.name
    expect(page).to have_content body
    expect(page).to have_content user.email
  end
end

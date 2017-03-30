require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  let!(:user) { FactoryGirl.create(:user, password: '12345678') }
  let!(:issue) { FactoryGirl.create(:issue, user: user) }
  let!(:comment) { FactoryGirl.create(:comment, user: user, issue: issue) }
  before(:each) do
    login_as user
    visit issues_path
    page.first('img.media-obiect').click
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
    expect(page).to have_content fbody
    expect(page).to have_content user.email
  end
end

require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest # :nodoc:
  setup do
    @issue = issues(:one)
  end

  test 'should get index' do
    get issues_url
    assert_response :success
  end

  test 'should get new' do
    get new_issue_url
    assert_response :success
  end

  test 'should create issue' do
    assert_difference('Issue.count') do
      post issues_url, params: { issue: { body: @issue.body,
                                          name: @issue.name,
                                          priority: @issue.priority,
                                          status: @issue.status } }
    end

    assert_redirected_to issue_url(Issue.last)
  end

  test 'should show issue' do
    get issue_url(@issue)
    assert_response :success
  end

  test 'should get edit' do
    get edit_issue_url(@issue)
    assert_response :success
  end

  test 'should update issue' do
    patch issue_url(@issue), params: { issue: { body: @issue.body,
                                                name: @issue.name,
                                                priority: @issue.priority,
                                                status: @issue.status } }
    assert_redirected_to issue_url(@issue)
  end

  test 'should destroy issue' do
    assert_difference('Issue.count', -1) do
      delete issue_url(@issue)
    end

    assert_redirected_to issues_url
  end
end
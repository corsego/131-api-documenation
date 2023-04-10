require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get root_url
    assert_response :success
    assert_match 'StaticPages#landing_page', response.body
  end

  test "unauthenticated user should not get dashboard" do
    get dashboard_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_match 'You need to sign in or sign up', response.body
  end

  test "should get dashboard" do
    user = users(:one)
    sign_in user
    get dashboard_url
    assert_response :success
    assert_match 'StaticPages#dashboard', response.body
    assert_match user.email, response.body
  end
end

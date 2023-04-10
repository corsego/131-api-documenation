require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get root_url
    assert_response :success
    assert_match 'StaticPages#landing_page', response.body
  end

  test "should get dashboard" do
    get dashboard_url
    assert_response :success
    assert_match 'StaticPages#dashboard', response.body
  end
end

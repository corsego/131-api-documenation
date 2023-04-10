require 'application_system_test_case'

class DeviseAuthSystemTest < ApplicationSystemTestCase
  test 'landing page works for all' do
    visit root_url
    assert_text 'StaticPages#landing_page'
  end

  test 'dashboard not for unauthenticated users' do
    visit dashboard_url
    assert_text 'You need to sign in or sign up'
  end

  test 'sign in existing user' do
    user = users(:one)
    sign_in user

    visit dashboard_url
    assert_text 'StaticPages#dashboard'
  end

  test 'sign in new user' do
    email = 'yaroslav@superails.com'
    password = "123456789"
    user = User.create(email: email, password: password)
    visit dashboard_url
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    assert_current_path dashboard_url
    assert_text 'StaticPages#dashboard'
  end
end
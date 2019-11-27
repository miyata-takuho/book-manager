require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_home_url
    assert_response :success
  end

  test "should get user" do
    get main_user_url
    assert_response :success
  end

  test "should get book" do
    get main_book_url
    assert_response :success
  end

end

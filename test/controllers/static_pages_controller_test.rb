require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "/"
    assert_response :success
  end

  test "should get help" do
    get "/static_pages/help"
    assert_response :success
  end
end

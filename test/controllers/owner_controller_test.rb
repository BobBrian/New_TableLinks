require "test_helper"

class OwnerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get owner_home_url
    assert_response :success
  end
end

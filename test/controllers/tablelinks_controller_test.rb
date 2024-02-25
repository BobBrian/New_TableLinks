require "test_helper"

class TablelinksControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get tablelinks_home_url
    assert_response :success
  end
end
